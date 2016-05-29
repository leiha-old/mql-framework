// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Trade.mqh"

class TradePosition : public Trade
{  
   public : 

/* --------------------
 * Constructors
 * ----- 
 */          
   /** 
    */
   TradePosition(  ) 
      : Trade(  )
   {
      
   };

/* --------------------
 * Methods
 * ----- 
 */   
      /**
       * Position ticket
       */      
      long                 ticket         (  ) { return getInteger( POSITION_TICKET          ); };
            
      /**
       * Position open time
       */      
      datetime             time           (  ) { return 
                                           ( datetime ) getInteger( POSITION_TIME            ); };
      
      /**
       * Position opening time in milliseconds since 01.01.1970
       */      
      long                 timeMsc        (  ) { return getInteger( POSITION_TIME_MSC        ); };

      /**
       * Position changing time in seconds since 01.01.1970
       */      
      long                 timeUpdate     (  ) { return getInteger( POSITION_TIME_UPDATE     ); };

      /**
       * Position changing time in milliseconds since 01.01.1970
       */      
      long                 timeUpdateMsc  (  ) { return getInteger( POSITION_TIME_UPDATE_MSC ); };
       
      /**
       * Position type
       */      
      ENUM_POSITION_TYPE   type           (  ) { return 
                                 ( ENUM_POSITION_TYPE ) getInteger( POSITION_TYPE            ); };
      
      /**
       * Position magic number (see ORDER_MAGIC) 
       */      
      long                 magic          (  ) { return getInteger( POSITION_MAGIC           ); };

      /**
       * Position identifier is a unique number assigned to each re-opened position
       */      
      long                 identifier     (  ) { return getInteger( POSITION_IDENTIFIER      ); };
      
      /* - */
      
      /**
       * Position volume
       */      
      double               volume         (  ) { return getDouble ( POSITION_VOLUME          ); };

      /**
       * Position open price
       */      
      double               priceOpen      (  ) { return getDouble ( POSITION_PRICE_OPEN      ); };
      
      /**
       * Stop Loss level of opened position
       */      
      double               stopLoss       (  ) { return getDouble ( POSITION_SL              ); };
      
      /**
       * Take Profit level of opened position
       */      
      double               takeProfit     (  ) { return getDouble ( POSITION_PROFIT          ); };

      /**
       * Current price of the position symbol
       */      
      double               priceCurrent   (  ) { return getDouble ( POSITION_PRICE_CURRENT   ); };
      
      /**
       * Cumulative swap
       */      
      double               swap           (  ) { return getDouble ( POSITION_SWAP            ); };
      
      /**
       * Current profit
       */      
      double               profit         (  ) { return getDouble ( POSITION_PROFIT          ); };
      
      /* - */
      
      /**
       * Symbol of the position
       */      
      string               symbol         (  ) { return getString ( POSITION_SYMBOL          ); };
   
      /**
       * Position comment
       */      
      string               comment        (  ) { return getString ( POSITION_COMMENT         ); };
      
   protected :
   
      long                 getInteger     ( ENUM_POSITION_PROPERTY_INTEGER property );
      
      double               getDouble      ( ENUM_POSITION_PROPERTY_DOUBLE  property );        
      
      string               getString      ( ENUM_POSITION_PROPERTY_STRING  property );
      
/* --------------------
 * Properties
 * ----- 
 */     
      
// -----
// --------------------     
};

/* 
 * ------
 */
long 
   TradePosition::getInteger
      ( ENUM_POSITION_PROPERTY_INTEGER property ) 
{
   long value;
   PositionGetInteger( property, value );  
   return value;
};

/* 
 * ------
 */
double
   TradePosition::getDouble
      ( ENUM_POSITION_PROPERTY_DOUBLE property ) 
{
   double value;
   PositionGetDouble( property, value );  
   return value;
};

/* 
 * ------
 */
string 
   TradePosition::getString
      ( ENUM_POSITION_PROPERTY_STRING property ) 
{
   string value;
   PositionGetString( property, value );
   return value;
};