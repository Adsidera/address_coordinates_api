# Address API

This is a simple web API that obtains a longitude and a latitude out of an address param.

If you want to run it locally, please clone the repo, `bundle install` it, run `rails db:migrate` and `rails db:seed` in order.

- [x] Create account & token in LocationIQ
- [x] Service object for Faraday requests to LocationIQ
- [x] Endpoint controller for retrieving geocoding lat/long and reverse lookup
- [x] make it private!
- [ ] tests
- [ ] Handle configuration changes accordingly - what happens if they change
- [ ] Avoid application crashes if third-party application does not work - Caching via Redis
