// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

//#include <Object.mqh>
class Object //: public CObject
{
   protected :
   
      /** 
       */
      template < typename T >
      T* pointer (T &o) {
         return GetPointer(o);
      };
   
   public :
      
      /**
       */
      Object* end()
      {
         return pointer(this);
      };
};