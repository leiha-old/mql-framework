// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Core/Object.mqh"
#include "../Buffer/Buffer.mqh"

class PlotUnifier : public Object
{
   public :   

/* --------------------
 * Constructors
 * ----- 
 */   
      /** 
       */
      PlotUnifier( Buffer* buffers )
         : Object(  )
         {
            _buffers = buffers;
         }
         ;  

/* --------------------
 * Methods
 * ----- 
 */
      /** 
       * Set the empty value
       * Usefull by example for the signals
       */
      PlotUnifier* emptyValue( double value = 0 );
      
      /** 
       * Set the empty value
       * Usefull by example for the signals
       */
      PlotUnifier* emptyValue( int plot, double value );
      
      /** 
       * Set Label of draw
       */
      PlotUnifier* label( string label );
      
      /** 
       * Set Label of draw
       */
      PlotUnifier* label( int plot, string label );
      
      /** 
       * Set Type Of draw
       */
      PlotUnifier* type( int type = DRAW_LINE );
      
      /** 
       * Set Type Of draw
       */
      PlotUnifier* type( int plot, int type );
      
      /**
       * Set Shift fr the drawing
       */
      PlotUnifier* begin( int shift = 0 );
      
      /**
       * Set Shift fr the drawing
       */
      PlotUnifier* begin( int plot, int shift = 0 );
      
      /**
       * Set color for drawing
       */
      PlotUnifier* c0lor( int c0lor );
      
      /**
       * Set color for drawing
       */
      PlotUnifier* c0lor( int plot, int c0lor );
      
      /**
       * Set Weight of draw
       */
      PlotUnifier* width( int width = 1 );
      
      /**
       * Set Weight of draw
       */
      PlotUnifier* width( int plot, int width = 1 );
      
      /**
       * Set Style of draw
       */
      PlotUnifier* style( ENUM_LINE_STYLE style = STYLE_SOLID );
      
      /**
       * Set Style of draw
       */
      PlotUnifier* style( int plot, ENUM_LINE_STYLE style );
      
   protected :
   
      /** 
       */
      Plot* get( int plot = 0 );


/* --------------------
 * Properties
 * ----- 
 */
   Buffer* _buffers;
   
// -----
// --------------------  
};

#include "./PlotUnifier.inc.mqh"

/** 
 */
PlotUnifier* 
   PlotUnifier::type
      ( int type = DRAW_LINE ) 
{
   for( int i = 0, t = _buffers.totalOfInternalBuffers(); i < t; i++ )
   {
      this.type( i, type );
   }
   return pointer( this );
};

/** 
 */
PlotUnifier* 
   PlotUnifier::type
      ( int plot, int type ) 
{
   this.get( plot ).type( type );
   return pointer( this );
};