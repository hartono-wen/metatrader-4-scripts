//+------------------------------------------------------------------+
//|                                      ExecuteActionOncePerBar.mq4 |
//|                                            hartono.wen@gmail.com |
//|                                   https://github.com/hartono-wen |
//+------------------------------------------------------------------+
//Reference: https://mql4tradingautomation.com/execute-action-once-per-bar-mql4/
//Credit: Luca Spinello

#property copyright "hartono.wen@gmail.com"
#property link      "https://github.com/hartono-wen"
#property version   "1.00"

#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

datetime LastBarDateTime;
int OnInit()
  {
//---
   string initializationTime = TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS);
   printf("----- Initialization at %s", initializationTime);
//---   
   return(INIT_SUCCEEDED);
   
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   string deinitializationTime = TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS);
   printf("----- Deinitialization at %s", deinitializationTime);
   
  }
  
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
/*
  Note:
  I only take the reference from:
  https://mql4tradingautomation.com/execute-action-once-per-bar-mql4/
  Credit belongs to: Luca Spinello, not me.

  Thank you.
*/
   if(LastBarDateTime != Time[0])
   {
      //Code to execute once in the bar
      Print("This code is executed only once in the bar started ", Time[1]);
      
      Print("-----Time: " + TimeToStr(Time[1]));
      //Print("---------- Open Price: " + DoubleToStr(iOpen(NULL, 0, 0)));
      Print("----------OHLC: " + DoubleToStr(Open[1]) + ", " + DoubleToStr(High[1]) + ", " + DoubleToStr(Low[1]) + ", " + DoubleToStr(Close[1]));
      
      
      
      LastBarDateTime = Time[0];
   }
   
  }
//+------------------------------------------------------------------+



