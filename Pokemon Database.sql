{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [],
   "source": [
    "import numpy as np\n",
    "import pandas as pd\n",
    "import sqlalchemy\n",
    "from sqlalchemy.ext.automap import automap_base\n",
    "from sqlalchemy.orm import Session\n",
    "from sqlalchemy import create_engine, func"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "metadata": {},
   "outputs": [],
   "source": [
    "engine=create_engine(\"sqlite:///{database_path}\")\n",
    "conn=engine.connect"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "metadata": {},
   "outputs": [],
   "source": [
    "Base = automap_base()\n",
    "Base.prepare(engine, reflect=True)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {},
   "outputs": [],
   "source": [
    "database_path=\"C:/Users/regin/Desktop/Pokemon Database/database.sql\""
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "metadata": {},
   "outputs": [
    {
     "ename": "OperationalError",
     "evalue": "(sqlite3.OperationalError) no such table: moves\n[SQL: select * from moves]\n(Background on this error at: http://sqlalche.me/e/e3q8)",
     "output_type": "error",
     "traceback": [
      "\u001b[1;31m---------------------------------------------------------------------------\u001b[0m",
      "\u001b[1;31mOperationalError\u001b[0m                          Traceback (most recent call last)",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_context\u001b[1;34m(self, dialect, constructor, statement, parameters, *args)\u001b[0m\n\u001b[0;32m   1245\u001b[0m                     self.dialect.do_execute(\n\u001b[1;32m-> 1246\u001b[1;33m                         \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1247\u001b[0m                     )\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\default.py\u001b[0m in \u001b[0;36mdo_execute\u001b[1;34m(self, cursor, statement, parameters, context)\u001b[0m\n\u001b[0;32m    587\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mdo_execute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mNone\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 588\u001b[1;33m         \u001b[0mcursor\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    589\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;31mOperationalError\u001b[0m: no such table: moves",
      "\nThe above exception was the direct cause of the following exception:\n",
      "\u001b[1;31mOperationalError\u001b[0m                          Traceback (most recent call last)",
      "\u001b[1;32m<ipython-input-8-2ac748319f1f>\u001b[0m in \u001b[0;36m<module>\u001b[1;34m\u001b[0m\n\u001b[1;32m----> 1\u001b[1;33m \u001b[0mdata\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mengine\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;34m\"select * from moves\"\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m      2\u001b[0m \u001b[1;32mfor\u001b[0m \u001b[0mrecord\u001b[0m \u001b[1;32min\u001b[0m \u001b[0mdata\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m      3\u001b[0m     \u001b[0mprint\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mrecord\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36mexecute\u001b[1;34m(self, statement, *multiparams, **params)\u001b[0m\n\u001b[0;32m   2180\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   2181\u001b[0m         \u001b[0mconnection\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_contextual_connect\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mclose_with_result\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mTrue\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 2182\u001b[1;33m         \u001b[1;32mreturn\u001b[0m \u001b[0mconnection\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m*\u001b[0m\u001b[0mmultiparams\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m**\u001b[0m\u001b[0mparams\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   2183\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   2184\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mscalar\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m*\u001b[0m\u001b[0mmultiparams\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m**\u001b[0m\u001b[0mparams\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36mexecute\u001b[1;34m(self, object_, *multiparams, **params)\u001b[0m\n\u001b[0;32m    974\u001b[0m         \"\"\"\n\u001b[0;32m    975\u001b[0m         \u001b[1;32mif\u001b[0m \u001b[0misinstance\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mobject_\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mstring_types\u001b[0m\u001b[1;33m[\u001b[0m\u001b[1;36m0\u001b[0m\u001b[1;33m]\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 976\u001b[1;33m             \u001b[1;32mreturn\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_execute_text\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mobject_\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mmultiparams\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparams\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    977\u001b[0m         \u001b[1;32mtry\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    978\u001b[0m             \u001b[0mmeth\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mobject_\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_execute_on_connection\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_text\u001b[1;34m(self, statement, multiparams, params)\u001b[0m\n\u001b[0;32m   1147\u001b[0m             \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1148\u001b[0m             \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1149\u001b[1;33m             \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1150\u001b[0m         )\n\u001b[0;32m   1151\u001b[0m         \u001b[1;32mif\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_has_events\u001b[0m \u001b[1;32mor\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mengine\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_has_events\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_context\u001b[1;34m(self, dialect, constructor, statement, parameters, *args)\u001b[0m\n\u001b[0;32m   1248\u001b[0m         \u001b[1;32mexcept\u001b[0m \u001b[0mBaseException\u001b[0m \u001b[1;32mas\u001b[0m \u001b[0me\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1249\u001b[0m             self._handle_dbapi_exception(\n\u001b[1;32m-> 1250\u001b[1;33m                 \u001b[0me\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1251\u001b[0m             )\n\u001b[0;32m   1252\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_handle_dbapi_exception\u001b[1;34m(self, e, statement, parameters, cursor, context)\u001b[0m\n\u001b[0;32m   1474\u001b[0m                 \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mraise_from_cause\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mnewraise\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexc_info\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1475\u001b[0m             \u001b[1;32melif\u001b[0m \u001b[0mshould_wrap\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1476\u001b[1;33m                 \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mraise_from_cause\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0msqlalchemy_exception\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexc_info\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1477\u001b[0m             \u001b[1;32melse\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1478\u001b[0m                 \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mreraise\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;33m*\u001b[0m\u001b[0mexc_info\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\util\\compat.py\u001b[0m in \u001b[0;36mraise_from_cause\u001b[1;34m(exception, exc_info)\u001b[0m\n\u001b[0;32m    396\u001b[0m     \u001b[0mexc_type\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexc_value\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexc_tb\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mexc_info\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    397\u001b[0m     \u001b[0mcause\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mexc_value\u001b[0m \u001b[1;32mif\u001b[0m \u001b[0mexc_value\u001b[0m \u001b[1;32mis\u001b[0m \u001b[1;32mnot\u001b[0m \u001b[0mexception\u001b[0m \u001b[1;32melse\u001b[0m \u001b[1;32mNone\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 398\u001b[1;33m     \u001b[0mreraise\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mtype\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mexception\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexception\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mtb\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mexc_tb\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcause\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mcause\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    399\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    400\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\util\\compat.py\u001b[0m in \u001b[0;36mreraise\u001b[1;34m(tp, value, tb, cause)\u001b[0m\n\u001b[0;32m    150\u001b[0m             \u001b[0mvalue\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m__cause__\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mcause\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    151\u001b[0m         \u001b[1;32mif\u001b[0m \u001b[0mvalue\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m__traceback__\u001b[0m \u001b[1;32mis\u001b[0m \u001b[1;32mnot\u001b[0m \u001b[0mtb\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 152\u001b[1;33m             \u001b[1;32mraise\u001b[0m \u001b[0mvalue\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mwith_traceback\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mtb\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    153\u001b[0m         \u001b[1;32mraise\u001b[0m \u001b[0mvalue\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    154\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_context\u001b[1;34m(self, dialect, constructor, statement, parameters, *args)\u001b[0m\n\u001b[0;32m   1244\u001b[0m                 \u001b[1;32mif\u001b[0m \u001b[1;32mnot\u001b[0m \u001b[0mevt_handled\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1245\u001b[0m                     self.dialect.do_execute(\n\u001b[1;32m-> 1246\u001b[1;33m                         \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1247\u001b[0m                     )\n\u001b[0;32m   1248\u001b[0m         \u001b[1;32mexcept\u001b[0m \u001b[0mBaseException\u001b[0m \u001b[1;32mas\u001b[0m \u001b[0me\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\default.py\u001b[0m in \u001b[0;36mdo_execute\u001b[1;34m(self, cursor, statement, parameters, context)\u001b[0m\n\u001b[0;32m    586\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    587\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mdo_execute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mNone\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 588\u001b[1;33m         \u001b[0mcursor\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    589\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    590\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mdo_execute_no_params\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mNone\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;31mOperationalError\u001b[0m: (sqlite3.OperationalError) no such table: moves\n[SQL: select * from moves]\n(Background on this error at: http://sqlalche.me/e/e3q8)"
     ]
    }
   ],
   "source": [
    "data=engine.execute(\"select * from moves\")\n",
    "for record in data:\n",
    "    print(record)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "metadata": {},
   "outputs": [
    {
     "ename": "DatabaseError",
     "evalue": "(sqlite3.DatabaseError) file is not a database\n[SQL: Select * from moves]\n(Background on this error at: http://sqlalche.me/e/4xp6)",
     "output_type": "error",
     "traceback": [
      "\u001b[1;31m---------------------------------------------------------------------------\u001b[0m",
      "\u001b[1;31mDatabaseError\u001b[0m                             Traceback (most recent call last)",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_context\u001b[1;34m(self, dialect, constructor, statement, parameters, *args)\u001b[0m\n\u001b[0;32m   1245\u001b[0m                     self.dialect.do_execute(\n\u001b[1;32m-> 1246\u001b[1;33m                         \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1247\u001b[0m                     )\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\default.py\u001b[0m in \u001b[0;36mdo_execute\u001b[1;34m(self, cursor, statement, parameters, context)\u001b[0m\n\u001b[0;32m    587\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mdo_execute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mNone\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 588\u001b[1;33m         \u001b[0mcursor\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    589\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;31mDatabaseError\u001b[0m: file is not a database",
      "\nThe above exception was the direct cause of the following exception:\n",
      "\u001b[1;31mDatabaseError\u001b[0m                             Traceback (most recent call last)",
      "\u001b[1;32m<ipython-input-12-fbe100935069>\u001b[0m in \u001b[0;36m<module>\u001b[1;34m\u001b[0m\n\u001b[0;32m      9\u001b[0m \u001b[0mcon\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mengine\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mconnect\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m     10\u001b[0m \u001b[1;31m#data=engine.execute(\"Select * from NationalNames where year >2013\")\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m---> 11\u001b[1;33m \u001b[0mdata\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mpd\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mread_sql\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;34m\"Select * from moves\"\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcon\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m     12\u001b[0m \u001b[0mdata\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\pandas\\io\\sql.py\u001b[0m in \u001b[0;36mread_sql\u001b[1;34m(sql, con, index_col, coerce_float, params, parse_dates, columns, chunksize)\u001b[0m\n\u001b[0;32m    436\u001b[0m             \u001b[0mcoerce_float\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mcoerce_float\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    437\u001b[0m             \u001b[0mparse_dates\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mparse_dates\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 438\u001b[1;33m             \u001b[0mchunksize\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mchunksize\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    439\u001b[0m         )\n\u001b[0;32m    440\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\pandas\\io\\sql.py\u001b[0m in \u001b[0;36mread_query\u001b[1;34m(self, sql, index_col, coerce_float, parse_dates, params, chunksize)\u001b[0m\n\u001b[0;32m   1216\u001b[0m         \u001b[0margs\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0m_convert_params\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0msql\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparams\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1217\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1218\u001b[1;33m         \u001b[0mresult\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;33m*\u001b[0m\u001b[0margs\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1219\u001b[0m         \u001b[0mcolumns\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mresult\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mkeys\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1220\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\pandas\\io\\sql.py\u001b[0m in \u001b[0;36mexecute\u001b[1;34m(self, *args, **kwargs)\u001b[0m\n\u001b[0;32m   1085\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m*\u001b[0m\u001b[0margs\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m**\u001b[0m\u001b[0mkwargs\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1086\u001b[0m         \u001b[1;34m\"\"\"Simple passthrough to SQLAlchemy connectable\"\"\"\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1087\u001b[1;33m         \u001b[1;32mreturn\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mconnectable\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;33m*\u001b[0m\u001b[0margs\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m**\u001b[0m\u001b[0mkwargs\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1088\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1089\u001b[0m     def read_table(\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36mexecute\u001b[1;34m(self, object_, *multiparams, **params)\u001b[0m\n\u001b[0;32m    974\u001b[0m         \"\"\"\n\u001b[0;32m    975\u001b[0m         \u001b[1;32mif\u001b[0m \u001b[0misinstance\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mobject_\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mstring_types\u001b[0m\u001b[1;33m[\u001b[0m\u001b[1;36m0\u001b[0m\u001b[1;33m]\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 976\u001b[1;33m             \u001b[1;32mreturn\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_execute_text\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mobject_\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mmultiparams\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparams\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    977\u001b[0m         \u001b[1;32mtry\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    978\u001b[0m             \u001b[0mmeth\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mobject_\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_execute_on_connection\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_text\u001b[1;34m(self, statement, multiparams, params)\u001b[0m\n\u001b[0;32m   1147\u001b[0m             \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1148\u001b[0m             \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1149\u001b[1;33m             \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1150\u001b[0m         )\n\u001b[0;32m   1151\u001b[0m         \u001b[1;32mif\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_has_events\u001b[0m \u001b[1;32mor\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mengine\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_has_events\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_context\u001b[1;34m(self, dialect, constructor, statement, parameters, *args)\u001b[0m\n\u001b[0;32m   1248\u001b[0m         \u001b[1;32mexcept\u001b[0m \u001b[0mBaseException\u001b[0m \u001b[1;32mas\u001b[0m \u001b[0me\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1249\u001b[0m             self._handle_dbapi_exception(\n\u001b[1;32m-> 1250\u001b[1;33m                 \u001b[0me\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1251\u001b[0m             )\n\u001b[0;32m   1252\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_handle_dbapi_exception\u001b[1;34m(self, e, statement, parameters, cursor, context)\u001b[0m\n\u001b[0;32m   1474\u001b[0m                 \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mraise_from_cause\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mnewraise\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexc_info\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1475\u001b[0m             \u001b[1;32melif\u001b[0m \u001b[0mshould_wrap\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1476\u001b[1;33m                 \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mraise_from_cause\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0msqlalchemy_exception\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexc_info\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1477\u001b[0m             \u001b[1;32melse\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1478\u001b[0m                 \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mreraise\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;33m*\u001b[0m\u001b[0mexc_info\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\util\\compat.py\u001b[0m in \u001b[0;36mraise_from_cause\u001b[1;34m(exception, exc_info)\u001b[0m\n\u001b[0;32m    396\u001b[0m     \u001b[0mexc_type\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexc_value\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexc_tb\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mexc_info\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    397\u001b[0m     \u001b[0mcause\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mexc_value\u001b[0m \u001b[1;32mif\u001b[0m \u001b[0mexc_value\u001b[0m \u001b[1;32mis\u001b[0m \u001b[1;32mnot\u001b[0m \u001b[0mexception\u001b[0m \u001b[1;32melse\u001b[0m \u001b[1;32mNone\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 398\u001b[1;33m     \u001b[0mreraise\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mtype\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mexception\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mexception\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mtb\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mexc_tb\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcause\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mcause\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    399\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    400\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\util\\compat.py\u001b[0m in \u001b[0;36mreraise\u001b[1;34m(tp, value, tb, cause)\u001b[0m\n\u001b[0;32m    150\u001b[0m             \u001b[0mvalue\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m__cause__\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mcause\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    151\u001b[0m         \u001b[1;32mif\u001b[0m \u001b[0mvalue\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m__traceback__\u001b[0m \u001b[1;32mis\u001b[0m \u001b[1;32mnot\u001b[0m \u001b[0mtb\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 152\u001b[1;33m             \u001b[1;32mraise\u001b[0m \u001b[0mvalue\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mwith_traceback\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mtb\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    153\u001b[0m         \u001b[1;32mraise\u001b[0m \u001b[0mvalue\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    154\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_context\u001b[1;34m(self, dialect, constructor, statement, parameters, *args)\u001b[0m\n\u001b[0;32m   1244\u001b[0m                 \u001b[1;32mif\u001b[0m \u001b[1;32mnot\u001b[0m \u001b[0mevt_handled\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1245\u001b[0m                     self.dialect.do_execute(\n\u001b[1;32m-> 1246\u001b[1;33m                         \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1247\u001b[0m                     )\n\u001b[0;32m   1248\u001b[0m         \u001b[1;32mexcept\u001b[0m \u001b[0mBaseException\u001b[0m \u001b[1;32mas\u001b[0m \u001b[0me\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32m~\\anaconda3\\lib\\site-packages\\sqlalchemy\\engine\\default.py\u001b[0m in \u001b[0;36mdo_execute\u001b[1;34m(self, cursor, statement, parameters, context)\u001b[0m\n\u001b[0;32m    586\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    587\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mdo_execute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mNone\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 588\u001b[1;33m         \u001b[0mcursor\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    589\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    590\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mdo_execute_no_params\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mNone\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;31mDatabaseError\u001b[0m: (sqlite3.DatabaseError) file is not a database\n[SQL: Select * from moves]\n(Background on this error at: http://sqlalche.me/e/4xp6)"
     ]
    }
   ],
   "source": [
    "#import SQL Alchemy and Pandas\n",
    "from sqlalchemy import create_engine\n",
    "import pandas as pd\n",
    "\n",
    "database_path=\"C:/Users/regin/Desktop/Pokemon Database/database.sqlite\"\n",
    "\n",
    "#create the SQL engine\n",
    "engine=create_engine(f\"sqlite:///{database_path}\")\n",
    "con=engine.connect()\n",
    "#data=engine.execute(\"Select * from NationalNames where year >2013\")\n",
    "data=pd.read_sql(\"Select * from moves\", con)\n",
    "data\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.6"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
