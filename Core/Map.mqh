// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class Map : public Object
{
   protected :
   
      Object* _items[];

   public :
      
      /**
       */
      int length () {
         return ArraySize(_items);
      };
      
      /**
       */
      int extend (int number = 1) {
         return ArrayResize(_items, length() + number);
      };
      
      /** 
       */
      Object* add() 
      {
         return add(create(), true);
      };
      
      /** 
       */
      Map* add(Object* o) 
      {
         _items[extend(1) - 1] = o;
         return pointer(this);
      };
      
      /**
       */
      template < typename T >
      T* add(T* o, bool chain) 
      {
         add(o);
         return o;
      };      
      
      /**
       */
      virtual Object* get(int i) 
      {
         return _items[i];
      };
      
      /** 
       */
      virtual Object* create() {
         return new Object();
      };   
};