# Address API


This is a simple web API that obtains a longitude and a latitude out of an address param, but only if you are logged and with a valid JWT token.
After having logged in via `/login`, you can send requests to the API via Postman, through the endpoint `https://geocodefun.herokuapp.com/api/v1`.
If you want to run it locally, please clone the repo, `bundle install` it, run `rails db:migrate` and `rails db:seed` in order.

## Design choices

This app uses the LocationIQ API to query and retrieve the latitude and longitude of a given address.

### Gems used and criteria
The main criteria I followed in choosing gems to handle specific functionalities was this: would I choose them in a production environment?

- HTTP calls - I have chosen to use the gem `Faraday`for handling the HTTP calls, instead of `Net::HTTP`, for more flexibility, imagining that in a hypothetic production environment it could be easily modified to accept other adapters (like Typhoeus, for instance)
- Service Patterns - I wrapped the external API call into a service object, the `GeocodeFetcher` which takes only a `query` argument and returns the response from the LocationIQ on its initialization. When it comes to using external services, I normally wrap them into a service, to keep it separate from the internal responsibilities of the original MVP architecture. That is - I would not love to have an external service directly called from a controller, as it would clutter it in the long run, it would break the Single Responsibility Principle and, last but not least, it would potentially expose sensitive data.
- Not publicly accessible - I chose to use a JWT authentication system, so only logged in users can be authorized to use the api. For that I created the `login` endpoint. The JWT authentication process is using the gem `jwt`, of course, and the gem `simple_command`. With the latter, we are decoupling the actions of authenticating the user via `jwt` as `command` objects, which are then easily usable in the `session_controller`, without cluttering it with calls to external services/libraries.
- Rendering the Coordinates - the `address_controller` is thus only responsible for rendering the response of the coordinates in json in the `index` method. The private method `set_address_request` calls the `GeocodeFetcher` only if there is a `params[:address]` in the request and set the `coordinates` by slicing just `lat`, `lon` and `display_name` from the response. The `index` method renders them in json - if after the check of the params presence by `set_address_request`, `coordinates` are `nil`, then the `index` method renders an error in json.
- Caching - if for some reason the external service LocationIQ is not available - rate limit exceeded, outage, etc. - then it is still possible to retrieve the already queried data via cache. Rails 5.2 comes with a built-in `redis_cache_store`, so I used that in the `GeocodeFetcher`, both in development and in production (Heroku)
- Handling configuration changes - as far as it concerns handling different configurations according to different environments, I used environment variables and I chose the gem `dotenv` to handle them in the development and test environment, via a `.env` file. Environment variables in production are managed differently. In the case of Heroku and AWS, for instance, they need to be manually added right after deploy or, like in the case of `Redis` and its `REDIS_URL` variable, they may be added automatically.

### Testing

I tried to use as much testing as possible, unit tests and requests spec. I chose to use a request spec instead of a controller spec, as this is also the recommended best practice in RSpec now and it would have turned out to be a duplicate file, since the main logic for querying is not in the controller itself.

- [x] Create account & token in LocationIQ
- [x] Service object for Faraday requests to LocationIQ
- [x] Endpoint controller for retrieving geocoding lat/long and reverse lookup
- [x] make it private!
- [x] unit and request tests
- [x] Handle configuration changes accordingly
- [x] Avoid application crashes if third-party application does not work - Caching via Redis
