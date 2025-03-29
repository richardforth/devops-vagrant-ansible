# Special Case requires a SOLR_DOMAIN to avoid the prompt that will cause vagrant to time out

## Specify your domain at initialization instead of just `vagrant up`

```bash

SOLR_DOMAIN=solr.example.com vagrant up --provision

``