# schauer

A weather app using some open api.

## Planned features:
- weather based on location
- current conditions:
    - temperature (high, low, current)
    - humidity
    - precipitation next x hours
        - probability and actual values
    - visibility (fog)
    - warnings (?)
    - windspeed + direction
    - Sunrise and Sunset Times
- short and longtime forecasts, e.g., day, 7 days
- historic comparison

## APIs:
- https://app.tomorrow.io/signup?planid=60d46beae90c3b3549a59ff3
- https://api.met.no/weatherapi/locationforecast/2.0/documentation
- https://dwd.api.bund.dev/ / https://opendata.dwd.de/ / https://github.com/bundesAPI/dwd-api


## "Technologies":
- Pattern: https://pub.dev/packages/flutter_bloc
- Networking: https://pub.dev/packages/dio
- Plotting: https://pub.dev/packages/syncfusion_flutter_charts
- Inspiration: https://chat.openai.com/
- Blockchain & some shady crypto coin 