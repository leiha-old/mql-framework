// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

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
      ( int slot ) 
{
   return new Plot( slot );
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