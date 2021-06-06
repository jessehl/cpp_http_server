#pragma once

class LMserver
{
 private:
     boost::mutex storageMutex;
     std::vector<std::string> lockVector;

 private:
     bool getLock(std::string lockName)
     {
       searchLock.lock();
       for (long unsigned int i = 0; i < locks.size(); i++) {
         if (lockName == locks[i]) {
           searchLock.unlock();
           return false;
         }
       }

       locks.push_back(lockName);
       searchLock.unlock();
       return true;
     }

 public:


};
