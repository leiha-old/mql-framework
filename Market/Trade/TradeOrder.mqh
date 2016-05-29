// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Trade.mqh"

class TradeOrder : public Trade
{  
   public : 

/* --------------------
 * Constructors
 * ----- 
 */          
      /** 
       */
      TradeOrder(  ) 
         : Object(  )
         {}
         ;

/* --------------------
 * Methods
 * ----- 
 */   
      string   comment        (  );

      string   symbol         (  );

      double   takeProfit     (  );

      double   stopLoss       (  );

      long     ticket         (  );
      
      long     magic          (  );
      
      long     timeDone       (  );

      long     timeDoneMsc    (  );
      
      long     timeExpiration (  );
      
      long     timeSetup      (  );
      
      long     timeSetupMsc   (  );
       
      double   volumeCurrent  (  );

      double   volumeInitial  (  );

      long     type           (  );

      long     state          (  );

      long     typeFilling    (  );

      long     typeTime       (  );

      long     positionId     (  );
      
      long     positionById   (  );
      
      double   priceStopLimit (  );

      double   priceCurrent   (  );

      double   priceOpen      (  );     
      
   protected :
   
      string getString        ( ENUM_ORDER_PROPERTY_STRING  property );

      long   getInteger       ( ENUM_ORDER_PROPERTY_INTEGER property );
      
      double getDouble        ( ENUM_ORDER_PROPERTY_DOUBLE  property );
      
      
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
string
   TradeOrder::comment
      (  ) 
{
   return getString( ORDER_COMMENT );
};

/* 
 * ------
 */
string
   TradeOrder::symbol
      (  ) 
{
   return getString( ORDER_SYMBOL );
};

/* 
 * ------
 */
double
   TradeOrder::priceStopLimit
      (  ) 
{
   return getDouble( ORDER_PRICE_STOPLIMIT );
};

/* 
 * ------
 */
double
   TradeOrder::priceCurrent
      (  ) 
{
   return getDouble( ORDER_PRICE_CURRENT );
};

/* 
 * ------
 */
double
   TradeOrder::takeProfit
      (  ) 
{
   return getDouble( ORDER_TP );
};

/* 
 * ------
 */
double
   TradeOrder::stopLoss
      (  ) 
{
   return getDouble( ORDER_SL );
};

/* 
 * ------
 */
double
   TradeOrder::priceOpen
      (  ) 
{
   return getDouble( ORDER_PRICE_OPEN );
};

/* 
 * ------
 */
double
   TradeOrder::volumeCurrent
      (  ) 
{
   return getDouble( ORDER_VOLUME_CURRENT );
};

/* 
 * ------
 */
double
   TradeOrder::volumeInitial
      (  ) 
{
   return getDouble( ORDER_VOLUME_INITIAL );
};

/* 
 * ------
 */
long
   TradeOrder::ticket
      (  ) 
{
   return getInteger( ORDER_TICKET );
};

/* 
 * ------
 */
long
   TradeOrder::timeSetup
      (  ) 
{
   return getInteger( ORDER_TIME_SETUP );
};

/* 
 * ------
 */
long
   TradeOrder::type
      (  ) 
{
   return getInteger( ORDER_TYPE );
};

/* 
 * ------
 */
long
   TradeOrder::state
      (  ) 
{
   return getInteger( ORDER_STATE );
};

/* 
 * ------
 */
long
   TradeOrder::timeExpiration
      (  ) 
{
   return getInteger( ORDER_TIME_EXPIRATION );
};

/* 
 * ------
 */
long
   TradeOrder::timeDone
      (  ) 
{
   return getInteger( ORDER_TIME_DONE );
};

/* 
 * ------
 */
long
   TradeOrder::timeSetupMsc
      (  ) 
{
   return getInteger( ORDER_TIME_SETUP_MSC );
};

/* 
 * ------
 */
long
   TradeOrder::timeDoneMsc
      (  ) 
{
   return getInteger( ORDER_TIME_DONE_MSC );
};

/* 
 * ------
 */
long
   TradeOrder::typeFilling
      (  ) 
{
   return getInteger( ORDER_TYPE_FILLING );
};

/* 
 * ------
 */
long
   TradeOrder::typeTime
      (  ) 
{
   return getInteger( ORDER_TYPE_TIME );
};

/* 
 * ------
 */
long
   TradeOrder::magic
      (  ) 
{
   return getInteger( ORDER_MAGIC );
};


/* 
 * ------
 */
long
   TradeOrder::positionId
      (  ) 
{
   return getInteger( ORDER_POSITION_ID );
};


/* 
 * ------
 */
long
   TradeOrder::positionById
      (  ) 
{
   return getInteger( ORDER_POSITION_BY_ID );
};

/* 
 * ------
 */
string 
   TradeOrder::getString
      ( ENUM_ORDER_PROPERTY_STRING property ) 
{
   string value;
   OrderGetString( property, value );
   return value;
};

/* 
 * ------
 */
long 
   TradeOrder::getInteger
      ( ENUM_ORDER_PROPERTY_INTEGER property ) 
{
   long value;
   OrderGetInteger( property, value );  
   return value;
};

/* 
 * ------
 */
double
   TradeOrder::getDouble
      ( ENUM_ORDER_PROPERTY_DOUBLE property ) 
{
   double value;
   OrderGetDouble( property, value );  
   return value;
};