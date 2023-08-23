# ...

resource "aws_cloudfront_distribution" "default" {
    comment = "[${var.tags.Name}] CloudFront distribution"
    is_ipv6_enabled = true
    price_class = "PriceClass_All"
    http_version = "http2"
    wait_for_deployment = false
    retain_on_delete = false
    enabled = true

    aliases = ["qa.apps.elsaschools.edu.au"]

    origin {
        domain_name = var.origins.s3_media
        origin_id = local.origin_id_s3_media
        origin_access_control_id = aws_cloudfront_origin_access_control.s3.id
    }

    origin {
        domain_name = var.origins.load_balancer
        origin_id = local.origin_id_load_balancer
        custom_header {
            name = "CloudFront-Token"
            value = random_id.hash.hex
        }
        custom_origin_config {
            http_port = "80"
            https_port = "443"
            origin_keepalive_timeout = 5
            origin_protocol_policy = "http-only"
            origin_ssl_protocols = ["TLSv1.2"]
            origin_read_timeout = 30
        }
    }

    default_cache_behavior {
        allowed_methods = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
        cached_methods = ["GET", "HEAD"]
        target_origin_id = local.origin_id_load_balancer
        viewer_protocol_policy = "redirect-to-https"
        #viewer_protocol_policy = "allow-all"
        compress = true
        smooth_streaming = false
        cache_policy_id = data.aws_cloudfront_cache_policy.managed_caching_disabled.id
        origin_request_policy_id = data.aws_cloudfront_origin_request_policy.managed_all_viewer_and_cloudfront_headers.id
    }

    # Cache behavior with precedence 1
    ordered_cache_behavior {
        path_pattern = "/media/*"
        allowed_methods = ["GET", "HEAD", "OPTIONS"]
        cached_methods = ["GET", "HEAD", "OPTIONS"]
        target_origin_id = local.origin_id_s3_media
        viewer_protocol_policy = "redirect-to-https"
        compress = true
        smooth_streaming = false
        cache_policy_id = data.aws_cloudfront_cache_policy.managed_caching_disabled.id
        #origin_request_policy_id = data.aws_cloudfront_origin_request_policy.managed_all_viewer_and_cloudfront_headers.id
        function_association {
            event_type = "viewer-request"
            function_arn = aws_cloudfront_function.add_index_html.arn
        }
    }

    viewer_certificate {
        acm_certificate_arn = "arn:aws:acm:us-east-1:456595949046:certificate/7d7be959-aa60-4f94-96c0-2652f71f792d"
        ssl_support_method = "sni-only"
        minimum_protocol_version = "TLSv1.2_2021"

        # cloudfront_default_certificate = true
        # minimum_protocol_version = "TLSv1"
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

#    logging_config {
#        include_cookies = false
#        bucket = "example.com"
#        prefix = "cloudfront/example.com/"
#    }

}
