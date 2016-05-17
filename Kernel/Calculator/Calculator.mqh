// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Core/Object.mqh"
#include "../Buffer/Buffer.mqh"
#include "../Plot/PlotUnifier.mqh"

class Calculator : public Object
{
   public :

/* --------------------
 * Constructors
 * ----- 
 */     
      /** 
       */
      Calculator(  )
         : Object(  )
         {
            _calculators = new Map();
            _buffers     = new Buffer(); 
            _plotUnifier = new PlotUnifier( _buffers );
            
            this.totalOfInternalCalculators( 1 )
                .add                       ( pointer( this ) )
                ;
         }
      ;

/* --------------------
 * Methods
 * ----- 
 */     
      /** 
       */
      virtual int getIterationsNeeded            (  ) { return 1; };
      
      /** 
       */
      int preloadCandles                         (  ) { return _shiftTotal; };
      
      /** 
       */
      Calculator* preloadCandles                 ( int candles ) 
      {       
         _shiftBack  = candles; 
         _shiftTotal = _shiftBack + _shiftFront;
         return pointer( this );
      };
            
      /** 
       */
      template < typename T >
      T formatValue                              ( T value ) { return value; };
      
      /** 
       */
      virtual void onBeginFirstOnly              ( double &bufferSrc[] ){};
      
      /** 
       */
      virtual void onBeginFirstExcluded          ( double &bufferSrc[] ){};
      
      /** 
       */
      virtual void onBegin                       ( double &bufferSrc[] ){};
      
      /** 
       */
      virtual void onIterateCandleNotEnoughData  ( double &bufferSrc[], int candle, double value );
      
      /** 
       */
      virtual void onIterateCandle               ( double &bufferSrc[], int candle, double value );
      
      /** 
       */
      virtual void onEachBeginIteration          ( double &bufferSrc[], int rates_total, int prev_calculated, int iteration ){};
      
      /** 
       */
      virtual void onEachEndIteration            ( double &bufferSrc[], int rates_total, int prev_calculated, int iteration ){};
      
      /** 
       */
      virtual void onFinished                    ( double &bufferSrc[] ){};
      
      /** 
       */
      void onCalculate                           ( double &bufferSrc[], int rates_total, int prev_calculated );
      
      /** 
       */
      virtual void onCalculate                   ( Buffer* buffer, int rates_total, int prev_calculated );
      
      /** 
       */
      void onIterate                             ( double &bufferSrc[], int rates_total, int prev_calculated, int candle );
      
      /** 
       * Get Calculator by index
       */
      virtual Calculator* get( int i );
      
      /** 
       * Get first Calculator 
       * The Calculator is created if not already present
       */
      virtual Calculator* get(  );   
      
      /** 
       * Get Buffer by index
       */
      virtual Buffer* buffer( int index );
      
      /** 
       * Get first Buffer 
       * The Buffer is created if not already present
       */
      virtual Buffer* buffer(  ); 
      
      /** 
       */
      Plot* plot( int i );
      
      /** 
       */
      PlotUnifier* plot(  );
      
      /** 
       */
      virtual Calculator* shift( int back, int front );
      
      /**
       */
      virtual Calculator* end();
      
      /**
       */
      Calculator* add( Calculator* c );
   
   protected :
   
      /**
       * Create a new Calculator 
       */
      virtual Calculator* create(  );
      
      /**
       */
      int totalOfInternalCalculators(  );
            
      /**
       */
      Calculator* totalOfInternalCalculators( int total );
 
/* --------------------
 * Properties
 * ----- 
 */
   /**
    * Container of Buffers needed for the calculator
    */
   Buffer*      _buffers;
   
   /**
    * Container of Calculators Children who need this Calculator on slave
    */
   Map*         _calculators;
   
   /**
    */
   PlotUnifier* _plotUnifier;
      
   /**
    */
   int     _totalOfInternalCalculators;
   
   /**
    */
   int     _shiftBack;
   
   /**
    */
   int     _shiftFront;
   
   /**
    */
   int     _shiftTotal;

// -----
// -------------------- 
};


/** 
 */
Calculator* 
   Calculator::add
      ( Calculator* c )
{
   _calculators.add( c );

   return pointer( this ); 
};

/*
 * ------
 */
int 
   Calculator::totalOfInternalCalculators
      (  )
{
   return _totalOfInternalCalculators;
};

/*
 * ------
 */
Calculator* 
   Calculator::totalOfInternalCalculators
      ( int total )
{
   _totalOfInternalCalculators = total;
   return  pointer( this );
};

/*
 * ------
 */
void 
   Calculator::onIterateCandleNotEnoughData  
      ( double &bufferSrc[], int candle, double value )
{
   buffer().data[candle] = bufferSrc[candle];
};

/*
 * ------
 */
void 
    Calculator::onIterateCandle
      ( double &bufferSrc[], int candle, double value )
{
   buffer().data[candle] = bufferSrc[candle];
};

/*
 * ------
 */
Calculator* 
   Calculator::create
      (  ) 
{
   return new Calculator();
};

/* 
 * ------
 */
Calculator* 
   Calculator::end
      (  )
{
   return Object::end(  );
};

/* 
 * ------
 */
Calculator* 
   Calculator::get
      ( int i ) 
{
   return _calculators.get( i );
};

/* 
 * ------
 */
Calculator* 
   Calculator::get
      (  ) 
{
   if( _calculators.length() == 0 ) 
   {
      _calculators.add( pointer( this ) );
   }
   
   return _calculators.get( 0 );
}; 

/* 
 * ------
 */
Buffer* 
   Calculator::buffer
      ( int i ) 
{
   return _buffers.get( i );
};

/* 
 * ------
 */
Buffer* 
   Calculator::buffer
      (  ) 
{
   return _buffers.get();
};

/* 
 * ------
 */
Plot* 
   Calculator::plot
      ( int i ) 
{
   return buffer( i ).plot(  );
};

/* 
 * ------
 */
PlotUnifier* 
   Calculator::plot
      (  ) 
{
   return _plotUnifier;
};

/* 
 * ------
 */
Calculator* 
   Calculator::shift
      ( int back, int front ) 
{
   _shiftBack  = back;
   _shiftFront = front;
   _shiftTotal = back + front + 1;
   
   return pointer( this );
};

/* 
 * ------
 */
void 
   Calculator::onCalculate 
      ( Buffer* buffer, int rates_total, int prev_calculated )
{
   double b[];
   buffer.copy( b );
   this.onCalculate( b, rates_total, prev_calculated );
};

/* 
 * ------
 */
void 
   Calculator::onCalculate 
      ( double &bufferSrc[], int rates_total, int prev_calculated ) 
{
   // -
   if( prev_calculated == 0 ) 
   {
      this.onBeginFirstOnly    ( bufferSrc );
   } 
   else 
   {
      this.onBeginFirstExcluded( bufferSrc );
   }
   
   // -
   this.onBegin( bufferSrc );
   
   // -
   for( int i = 1, t = this.getIterationsNeeded(); i <= t; i++ ) 
   {
      this.onEachBeginIteration( bufferSrc, rates_total, prev_calculated, i );
   
      for( int candle = prev_calculated; candle < rates_total; candle++ ) 
      {
         this.onIterate( bufferSrc, rates_total, prev_calculated, candle );
      }
      
      this.onEachEndIteration( bufferSrc, rates_total, prev_calculated, i );
   }
   
   // -
   for( int i = ( this.totalOfInternalCalculators() ), t = _calculators.length(); i < t; i++ ) 
   {
      this.get( i )
         .onCalculate( this.buffer(), rates_total, prev_calculated )
         ;
   }
   
   // -
   this.onFinished( bufferSrc );
};

/* 
 * ------
 */
void 
   Calculator::onIterate 
      ( double &bufferSrc[], int rates_total, int prev_calculated, int candle )
{
   double value = this.formatValue( bufferSrc[ candle ] );
   if( candle <= this.preloadCandles() ) 
   {
      this.onIterateCandleNotEnoughData( bufferSrc, candle, value );
   } 
   else 
   {
      this.onIterateCandle( bufferSrc, candle, value );
   }
};