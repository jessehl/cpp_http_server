#include "crow.h"

int main()
{
    crow::SimpleApp app;

    CROW_ROUTE(app, "/")([](){
        return "Hello, LyingDutch";
    });

    // run on port 8080
    app.port(8000).multithreaded().run();
}