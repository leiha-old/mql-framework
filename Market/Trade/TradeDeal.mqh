// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Trade.mqh"

class TradeDeal : public Trade
{  
   public : 

/* --------------------
 * Constructors
 * ----- 
 */          
   /** 
    */
   Deal(  ) 
      : Object(  )
   {
      
   };

/* --------------------
 * Methods
 * ----- 
 */   
      /**
       * Deal ticket. Unique number assigned to each deal
       */      
      long                 ticket         (  ) { return getInteger( DEAL_TICKET          ); };
            
      /**
       * Deal order number
       */      
      long                 order          (  ) { return getInteger( DEAL_TIME            ); };
      
      /**
       * Deal time
       */      
      datetime             time           (  ) { return 
                                           ( datetime ) getInteger( DEAL_TIME_MSC        ); };

      /**
       * The time of a deal execution in milliseconds since 01.01.1970
       */      
      long                 timeMsc        (  ) { return getInteger( DEAL_TIME_MSC        ); };

      /**
       * Deal type
       */      
      ENUM_DEAL_TYPE       type           (  ) { return 
                                     ( ENUM_DEAL_TYPE ) getInteger( DEAL_TYPE            ); };
      
      /**
       * Deal entry - entry in, entry out, reverse
       */      
      long                 entry          (  ) { return getInteger( DEAL_ENTRY           ); };
      
      /**
       * Deal magic number (see ORDER_MAGIC)
       */      
      long                 magic          (  ) { return getInteger( DEAL_MAGIC           ); };

      /**
       * Identifier of a position, in the opening, modification or closing 
       *  of which this deal took part. 
       *
       * Each position has a unique identifier that is assigned to all deals 
       *  executed for the symbol during the entire 
       *   lifetime of the position.
       */      
      long                 positionId     (  ) { return getInteger( DEAL_POSITION_ID     ); };      
      
      /* - */
      
      /**
       * Deal volume
       */      
      double               volume         (  ) { return getDouble ( DEAL_VOLUME          ); };

      /**
       * Deal price
       */      
      double               price          (  ) { return getDouble ( DEAL_PRICE           ); };
      
      /**
       * Deal commission
       */      
      double               commission     (  ) { return getDouble ( DEAL_COMMISSION      ); };
      
      /**
       * Take Profit level of opened position
       */      
      double               takeProfit     (  ) { return getDouble ( DEAL_PROFIT          ); };

      /**
       * Cumulative swap on close
       */      
      double               swap           (  ) { return getDouble ( DEAL_SWAP            ); };
      
      /**
       * Current profit
       */      
      double               profit         (  ) { return getDouble ( DEAL_PROFIT          ); };
      
      /* - */
      
      /**
       * Deal symbol
       */      
      string               symbol         (  ) { return getString ( DEAL_SYMBOL          ); };
   
      /**
       * Deal comment
       */      
      string               comment        (  ) { return getString ( DEAL_COMMENT         ); };
      
      /**
       * Deal identifier in an external trading system (on the Exchange)
       */      
      string               externalId     (  ) { return getString ( DEAL_COMMENT         ); };
      
   protected :
   
      long                 getInteger     ( ENUM_DEAL_PROPERTY_INTEGER property );
      
      double               getDouble      ( ENUM_DEAL_PROPERTY_DOUBLE  property );        
      
      string               getString      ( ENUM_DEAL_PROPERTY_STRING  property );
      
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
   Deal::getInteger
      ( ENUM_DEAL_PROPERTY_INTEGER property ) 
{
   long value;
   HistoryDealGetInteger( property, value );  
   return value;
};

/* 
 * ------
 */
double
   Deal::getDouble
      ( ENUM_DEAL_PROPERTY_DOUBLE property ) 
{
   double value;
   HistoryDealGetDouble( property, value );  
   return value;
};

/* 
 * ------
 */
string 
   Deal::getString
      ( ENUM_DEAL_PROPERTY_STRING property ) 
{
   string value;
   HistoryDealGetString( property, value );
   return value;
};

/*
 * ------
 */
void 
   Deal::populate
      (  )
{
   ulong ticket; 
   for( int i = HistoryDealsTotal(  ) - 1 ; i >= 0 ; i-- ) 
   {
      if( ( ticket = HistoryDealGetTicket( i ) ) > 0 ) {
      
      } 
   }      
};