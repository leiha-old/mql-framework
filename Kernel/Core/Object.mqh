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
      
      Object* _parent;
   
   public :
   
      /**
       */
      Object* parent( Object &o )
      {
         _parent = pointer( o );
         return pointer( this );
      };
      
      /**
       */
      template < typename T >
      T* end( T &o )
      {
         return pointer( o );
      };
      
      /**
       */
      virtual Object* end()
      {
         return _parent 
            ? _parent 
            : pointer ( this )
            ;
      };
};