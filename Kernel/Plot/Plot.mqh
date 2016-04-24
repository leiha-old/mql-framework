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
      Plot(  )
         : Object(  ) 
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
      
   protected :
      
      /**
       * Create a new plot 
       */
      virtual Plot* create(  );
      
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

/** 
 */
int 
   Plot::slot
      (  ) 
{
   return _slot;
};

/** 
 */
Plot* 
   Plot::emptyValue
      ( double value = 0 ) 
{
   return setDouble( PLOT_EMPTY_VALUE, value );
};

/** 
 */
Plot* 
   Plot::label
      ( string label ) 
{
   return setString( PLOT_LABEL, label );
};

/** 
 */
Plot* 
   Plot::type
      ( ENUM_DRAW_TYPE type = DRAW_LINE ) 
{
   return setInteger( PLOT_DRAW_TYPE, type );
};

/**
 */
Plot* 
   Plot::begin
      ( int shift = 0 ) 
{
   return setInteger( PLOT_DRAW_BEGIN, shift );
};

/**
 */
Plot* 
   Plot::c0lor
      ( int c0lor ) 
{
   return setInteger( PLOT_LINE_COLOR, c0lor );
};      

/**
 */
Plot* 
   Plot::c0lor
      ( int c0lor, int i ) 
{
   return setInteger( PLOT_LINE_COLOR, c0lor, i );      
};

/**
 */
Plot* 
   Plot::width
      ( int width = 1 ) 
{
   return setInteger( PLOT_LINE_WIDTH, width );
};

/**
 */
Plot* 
   Plot::style
      ( ENUM_LINE_STYLE style = STYLE_SOLID ) 
{
   return setInteger( PLOT_LINE_STYLE, style );
};

/** 
 */
Plot* 
   Plot::setString
      ( ENUM_PLOT_PROPERTY_STRING property, string value ) 
{
   PlotIndexSetString( slot(), property, value );  
   return pointer( this );
};

/** 
 */
Plot* 
   Plot::setInteger
      ( ENUM_PLOT_PROPERTY_INTEGER property, int value ) 
{
   PlotIndexSetInteger( slot(), property, value );  
   return pointer( this );
};

/** 
 */
Plot* 
   Plot::setInteger
      ( ENUM_PLOT_PROPERTY_INTEGER property, int value, int i ) 
{
   PlotIndexSetInteger( slot(), property, value, i );  
   return pointer( this );
};

/** 
 */
Plot* 
   Plot::setDouble
      ( ENUM_PLOT_PROPERTY_DOUBLE property, double value ) 
{
   PlotIndexSetDouble( slot(), property, value );  
   return pointer( this );
};

/** 
 */
Plot* 
   Plot::create
      (  ) 
{
   return new Plot();
}; 

/** 
 */
Plot* 
   Plot::get
      ( int i ) 
{
   return _plots.get( i );
};

/** 
 */
Plot* 
   Plot::get
      (  ) 
{
   if( _plots.length() == 0 ) 
   {
      _plots.add( pointer( this ) );
   }
   
   return _plots.get( 0 );
}; 