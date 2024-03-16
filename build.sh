clj -T:build build/uberjar
native-image --no-fallback --no-server --static -jar target/echo.jar target/echo

