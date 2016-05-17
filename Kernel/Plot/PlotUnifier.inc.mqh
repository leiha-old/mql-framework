// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

/** 
 */
Plot* 
   PlotUnifier::get
      ( int plot = 0 ) 
{
   return _buffers.plot( plot );
};

/** 
 */
PlotUnifier* 
   PlotUnifier::emptyValue
      ( double value = 0 ) 
{
   for( int i = 0, t = _buffers.totalOfInternalBuffers(); i < t; i++ )
   {
      this.emptyValue( i, value );
   }
   return pointer( this );
};

/** 
 */
PlotUnifier* 
   PlotUnifier::emptyValue
      ( int plot, double value ) 
{
   this.get( plot ).emptyValue( value );
   return pointer( this );
};

/** 
 */
PlotUnifier* 
   PlotUnifier::label
      ( string label ) 
{
   for( int i = 0, t = _buffers.totalOfInternalBuffers(); i < t; i++ )
   {
      this.label( i, label );
   }
   return pointer( this );
};

/** 
 */
PlotUnifier* 
   PlotUnifier::label
      ( int plot, string label ) 
{
   this.get( plot ).label( label );
   return pointer( this );
};

/**
 */
PlotUnifier* 
   PlotUnifier::begin
      ( int shift = 0 ) 
{
   for( int i = 0, t = _buffers.totalOfInternalBuffers(); i < t; i++ )
   {
      this.begin( i, shift );
   }
   return pointer( this );
};

/**
 */
PlotUnifier* 
   PlotUnifier::begin
      ( int plot, int shift = 0 ) 
{
   this.get( plot ).begin( shift );
   return pointer( this );
};

/**
 */
PlotUnifier* 
   PlotUnifier::c0lor
      ( int c0lor ) 
{
   for( int i = 0, t = _buffers.totalOfInternalBuffers(); i < t; i++ )
   {
      this.c0lor( i, c0lor );
   }
   return pointer( this );
};      

/**
 */
PlotUnifier* 
   PlotUnifier::c0lor
      ( int plot, int c0lor ) 
{
   this.get( plot ).c0lor( c0lor );
   return pointer( this );
};

/**
 */
PlotUnifier* 
   PlotUnifier::width
      ( int width = 1 ) 
{
   for( int i = 0, t = _buffers.totalOfInternalBuffers(); i < t; i++ )
   {
      this.width( i, width );
   }
   return pointer( this );
};

/**
 */
PlotUnifier* 
   PlotUnifier::width
      ( int plot, int width = 1 ) 
{
   this.get( plot ).width( width );
   return pointer( this );
};

/**
 */
PlotUnifier* 
   PlotUnifier::style
      ( ENUM_LINE_STYLE style ) 
{
   for( int i = 0, t = _buffers.totalOfInternalBuffers(); i < t; i++ )
   {
      this.style( i, style );
   }
   return pointer( this );
};
   
/**
 */
PlotUnifier* 
   PlotUnifier::style
      ( int plot, ENUM_LINE_STYLE style = STYLE_SOLID ) 
{
   this.get( plot ).style( style );
   return pointer( this );
};