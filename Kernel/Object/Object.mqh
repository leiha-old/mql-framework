// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

/**
 *  Base class for all objects
 */
class Object 
   //: public CObject
{

public 
   :
/* --------------------
 * Constructors
 * ----- 
 */   
   /** 
    */
   Object () 
      //:
   {
   
   };

/* --------------------
 * Methods
 * ----- 
 */      
protected 
   :
            
   /**
    * Returns pointer of variable passed as argument
    */
   template < typename T >
   T * 
      pointer 
         ( T &o ) 
   {
      T * p = GetPointer( o );
      return p;
   };
   
   /**
    * Returns pointer of current object
    */ /*
   template < typename T >
   T * 
      pointer 
         (  ) 
   {
      T * p = pointer( this );         
      return p;
   }; */
   
   /**
    * Set the parent of this object
    */
   template < typename T >
   T * 
      parent 
         ( Object * &o ) 
   {
      T *   p      = pointer(   );
          __parent = pointer( o );            
      return p;
   };
   
   /**
    * Returns the parent of this object
    */
   template < typename T >
   T * 
      parent 
         (  ) 
   {
      T * p = __parent;         
      return p;
   };
      
/* --------------------
 * Properties
 * ----- 
 */      

private 
   :
   
   /**
    * Parent of this object
    */
   Object * 
      __parent
      ;
   
// -----
// --------------------     
};