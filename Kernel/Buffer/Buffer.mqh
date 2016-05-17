// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Core/Array.mqh"
#include "../Core/Map.mqh"
#include "../Plot/Plot.mqh"


class Buffer : public Array
{
   public :   

/* --------------------
 * Constructors
 * ----- 
 */   
      /** 
       */
      Buffer( ENUM_INDEXBUFFER_TYPE type = INDICATOR_DATA )
         : _slot ( TOTAL_BUFFERS++ ),
           _totalOfInternalBuffers( 1 )
         {
            _buffers      = new Map(  );
            add           ( pointer( this ) );            
            SetIndexBuffer( slot(  ), data, type );   
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
       */
      Buffer* add( Buffer* b );

      /** 
       */
      Plot* plot( int i );
      
      /** 
       */
      Plot* plot(  );
      
      /** 
       * Get buffer by slot
       */
      virtual Buffer* get( int slot );
      
      /** 
       * Get first buffer 
       * The buffer is created if not already present
       */
      virtual Buffer* get(  );
      
      /** 
       */
      int totalBuffers(  );
      
      /**
       */
      int totalOfInternalBuffers(  );
      
      /**
       */
      Buffer* totalOfInternalBuffers( int buffers );
            
   protected :
   
      /**
       * Create a new buffer 
       */
      virtual Buffer* create(  );
      

/* --------------------
 * Properties
 * ----- 
 */
   /**
    */
   int    _slot;
   Plot*  _plot;
   Map *  _buffers;
   int static TOTAL_BUFFERS;
   int    _totalOfInternalBuffers;
      
// -----
// --------------------     
};


/** 
 */
int 
   Buffer::totalBuffers
      (  ) 
{
   return _buffers.length();
};

/*
 * ------
 */
int 
   Buffer::totalOfInternalBuffers
      (  )
{
   return _totalOfInternalBuffers;
};

/*
 * ------
 */
Buffer* 
   Buffer::totalOfInternalBuffers
      ( int buffers )
{
   _totalOfInternalBuffers += buffers;
   return pointer( this );
};


/** 
 */
int Buffer::TOTAL_BUFFERS = 0;

/** 
 */
int 
   Buffer::slot
      (  ) 
{
   return _slot;
};

/** 
 */
Plot* 
   Buffer::plot
      ( int i ) 
{
   return get( i ).plot(  );
};

/** 
 */
Plot* 
   Buffer::plot
      (  ) 
{
   if( _plot == NULL ) {
      _plot = new Plot( slot(  ) );
      _plot.parent( pointer( this ) );
   }
   return _plot;
};

/** 
 */
Buffer* 
   Buffer::add
      ( Buffer* b )
{
   _buffers.add( b );
   return pointer( this );   
};      

/**
 */
Buffer* Buffer::create() 
{
   return new Buffer();
};

/** 
 */
Buffer* Buffer::get( int i ) 
{
   return _buffers.get( i );
};

/** 
 */
Buffer* Buffer::get(  ) 
{
   if( length() == 0 ) 
   {
      _buffers.add( pointer( this ) );
   }
   
   return _buffers.get( 0 );
};