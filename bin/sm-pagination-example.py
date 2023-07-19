paginator = client.get_paginator('list_secrets')
for page in paginator.paginate():
for secret in page['SecretList']:
    print(secret)