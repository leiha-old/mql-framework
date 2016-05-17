// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Core/Object.mqh"
#include "../Core/Map.mqh"

class Plot : public Object
{
   public :   

/* --------------------
 * Constructors
 * ----- 
 */   
      /** 
       */
      Plot( int slot )
         : Object(  ),
           _slot ( slot )
         {
         
         }
         ;  

/* --------------------
 * Methods
 * ----- 
 */
      /**
       * Get a slot
       */
      int slot();
       
      /** 
       * Set the empty value
       * Usefull by example for the signals
       */
      Plot* emptyValue( double value = 0 );
      
      /** 
       * Set Label of draw
       */
      Plot* label( string label );
      
      /** 
       * Set Type Of draw
       */
      Plot* type( ENUM_DRAW_TYPE type = DRAW_LINE );
      
      /**
       * Set Shift fr the drawing
       */
      Plot* begin( int shift = 0 );
      
      /**
       * Set color for drawing
       */
      Plot* c0lor( int c0lor );
      
      /**
       * Set color for drawing
       */
      Plot* c0lor(  int c0lor, int i );
      
      /**
       * Set Weight of draw
       */
      Plot* width( int width = 1 );
      
      /**
       * Set Style of draw
       */
      Plot* style( ENUM_LINE_STYLE style = STYLE_SOLID );
      
      /** 
       * Get plot by index
       * Index is the number of the plot when he was inserted in the Map
       */
      Plot* get( int i );
      
      /** 
       * Get first plot 
       * The plot is created if not already present
       */
      Plot* get(  );
      
      /**
       */    
      
   protected :
      
      /**
       * Create a new plot 
       */
      virtual Plot* create( int slot );
      
      /** 
       */
      Plot* setString ( ENUM_PLOT_PROPERTY_STRING property, string value );
      
      /** 
       */
      Plot* setInteger( ENUM_PLOT_PROPERTY_INTEGER property, int value );
      
      /** 
       */
      Plot* setInteger( ENUM_PLOT_PROPERTY_INTEGER property, int value, int i ) ;
      
      /** 
       */
      Plot* setDouble ( ENUM_PLOT_PROPERTY_DOUBLE property, double value );    


/* --------------------
 * Properties
 * ----- 
 */
  
  /**
    */
   int _slot;
 
   /**
    */
   Map* _plots;
   
// -----
// --------------------  
};

#include "./Plot.inc.mqh"

/** 
 */
Plot* 
   Plot::type
      ( ENUM_DRAW_TYPE type = DRAW_LINE ) 
{
   return setInteger( PLOT_DRAW_TYPE, type );
};