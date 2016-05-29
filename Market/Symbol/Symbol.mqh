// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../../Kernel/Core/Object.mqh"

class Symb0l : public Object
{
   public : 

/* --------------------
 * Constructors
 * ----- 
 */          
      /** 
       */
      Symb0l(  ) 
         : Object(  )
         {}
         ;

/* --------------------
 * Methods
 * ----- 
 */         
};

class Symb0lSession : public Object
{
   public : 

/* --------------------
 * Constructors
 * ----- 
 */          
      /** 
       */
      Symb0l(  ) 
         : Object(  )
         {}
         ;

/* --------------------
 * Methods
 * ----- 
 */
      double                        volume           (  );
 
      double                        turnOver         (  );
 
      double                        interest         (  );
 
      double                        buyOrdersVolume  (  );
 
      double                        sellOrdersVolume (  );
 
      double                        open             (  );
 
      double                        close            (  );
      
      double                        aw               (  );
      
      double                        priceSettlement  (  );
      
      double                        priceLimitMin    (  );
      
      double                        priceLimitMax    (  );
      
      long                          deals            (  );

      long                          buyOrder         (  );

      long                          sellOrder        (  );         
};

class Symb0l : public Object
{  
   public : 

/* --------------------
 * Constructors
 * ----- 
 */          
      /** 
       */
      Symb0l(  ) 
         : Object(  )
         {}
         ;

/* --------------------
 * Methods
 * ----- 
 */         
      string comment        (  );

      string symbol         (  );

      double priceStopLimit (  );

      double priceCurrent   (  );

      double takeProfit     (  );

      double stopLoss       (  );

      double priceOpen      (  );
      
      double volume         (  );

      double swap           (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                                 (  );
      
      double                        marginHedGed     (  );

      
      bool                          select           (  );

      long                          volume           (  );

      long                          volumeHigh       (  );

      long                          volumeLow        (  );

      datetime                      time             (  );
      
      int                           digits           (  );

      int                           spread           (  );

      bool                          spreadFloat      (  );

      int                           ticksBookDepth   (  );

      ENUM_SYMBOL_CALC_MODE         tradeCalcMode    (  );

      ENUM_SYMBOL_TRADE_MODE        tradeMode        (  );

      datetime                      startTime        (  );

      datetime                      expirationTime   (  );
      
      int                           tradeStopsLevel  (  );

      int                           tradeFreezeLevel (  );

      ENUM_SYMBOL_TRADE_EXECUTION   tradeExeMode     (  );
 
      ENUM_SYMBOL_SWAP_MODE         swapMode         (  );

      ENUM_DAY_OF_WEEK              swapRollOver3Days(  );
      
      int                           expirationMode   (  );
      
      int                           fillingMode      (  );
      
      int                           orderMode        (  );
      
      ENUM_SYMBOL_OPTION_MODE       optionMode       (  );
      
      ENUM_SYMBOL_OPTION_RIGHT      optionRight      (  );
      
      
   protected :
   
      string getString      ( ENUM_POSITION_PROPERTY_STRING  property );

      long   getInteger     ( ENUM_POSITION_PROPERTY_INTEGER property );
      
      double getDouble      ( ENUM_POSITION_PROPERTY_DOUBLE  property );
      
      
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
   Symb0l::comment
      (  ) 
{
   return getString( POSITION_COMMENT );
};

/* 
 * ------
 */
string
   Symb0l::symbol
      (  ) 
{
   return getString( POSITION_SYMBOL );
};

/* 
 * ------
 */
double
   Symb0l::priceCurrent
      (  ) 
{
   return getDouble( POSITION_PRICE_CURRENT );
};

/* 
 * ------
 */
double
   Symb0l::takeProfit
      (  ) 
{
   return getDouble( POSITION_TP );
};

/* 
 * ------
 */
double
   Symb0l::stopLoss
      (  ) 
{
   return getDouble( POSITION_SL );
};

/* 
 * ------
 */
double
   Symb0l::priceOpen
      (  ) 
{
   return getDouble( POSITION_PRICE_OPEN );
};

/* 
 * ------
 */
double
   Symb0l::volume
      (  ) 
{
   return getDouble( POSITION_VOLUME );
};

/* 
 * ------
 */
double
   Symb0l::swap
      (  ) 
{
   return getDouble( POSITION_SWAP );
};

/* 
 * ------
 */
double
   Symb0l::profit
      (  ) 
{
   return getDouble( POSITION_PROFIT );
};

/* 
 * ------
 */
long
   Symb0l::ticket
      (  ) 
{
   return getInteger( POSITION_TICKET );
};

/* 
 * ------
 */
long
   Symb0l::time
      (  ) 
{
   return getInteger( POSITION_TIME );
};

/* 
 * ------
 */
long
   Symb0l::timeMsc
      (  ) 
{
   return getInteger( POSITION_TIME_MSC );
};

/* 
 * ------
 */
long
   Symb0l::timeUpdate
      (  ) 
{
   return getInteger( POSITION_TIME_UPDATE );
};

/* 
 * ------
 */
long
   Symb0l::timeUpdateMsc
      (  ) 
{
   return getInteger( POSITION_TIME_UPDATE_MSC );
};


/* 
 * ------
 */
long
   Symb0l::type
      (  ) 
{
   return getInteger( POSITION_TYPE );
};


/* 
 * ------
 */
long
   Symb0l::magic
      (  ) 
{
   return getInteger( POSITION_MAGIC );
};


/* 
 * ------
 */
long
   Symb0l::identifier
      (  ) 
{
   return getInteger( POSITION_IDENTIFIER );
};

/* 
 * ------
 */
string 
   Symb0l::getString
      ( ENUM_POSITION_PROPERTY_STRING property ) 
{
   string value;
   Symb0lGetString( property, value );
   return value;
};

/* 
 * ------
 */
long 
   Symb0l::getInteger
      ( ENUM_POSITION_PROPERTY_INTEGER property ) 
{
   long value;
   Symb0lGetInteger( property, value );  
   return value;
};

/* 
 * ------
 */
double
   Symb0l::getDouble
      ( ENUM_POSITION_PROPERTY_DOUBLE property ) 
{
   double value;
   Symb0lGetDouble( property, value );  
   return value;
};