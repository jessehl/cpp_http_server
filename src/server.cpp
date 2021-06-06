#include "crow.h"
#include <string>
#include <vector>
#include <boost/thread.hpp>
#include "LMserver.h"

std::vector<std::string> locks;
boost::mutex searchLock;

bool getLock(std::string lockName) 
{
  searchLock.lock();
  for (long unsigned int i = 0; i < locks.size(); i++) 
  {
    if (lockName == locks[i]) 
    {
      return false;
    }
  }

  locks.push_back(lockName);
  return true;
}

bool releaseLock(std::string lockName)
{
  searchLock.lock();
  for (long unsigned int i = 0; i < locks.size(); i++) 
  {
    if (lockName == locks[i]) 
    {
      locks.erase(locks.begin() + i);
      searchLock.unlock();
      return true;
    }
  }
  searchLock.unlock();
  return false;
}

int main()
{
    
    crow::SimpleApp app;
    CROW_ROUTE(app, "/")([]()
    {
        return "Hello LockWorld";
    });

    CROW_ROUTE(app, "/getLock/<string>") ( [](std::string lockName) 
    {   
        if (!getLock(lockName)) 
        {
          searchLock.unlock();
          return "false";
        }

        else 
        {          
          searchLock.unlock();
          return "true";
        }
    });

    CROW_ROUTE(app, "/releaseLock/<string>") ([](std::string lockName)
    { 
        if (releaseLock(lockName)) 
        { 
          return "Released";
        }

        else 
        {
          return "404 Lock not Found";
        }
    });

    // run on port 8080
    app.port(8000).multithreaded().run();
}
