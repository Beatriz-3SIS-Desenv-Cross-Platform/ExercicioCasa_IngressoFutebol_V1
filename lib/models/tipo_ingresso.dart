enum TipoIngresso {
  arquibancada,
  cadeira,
  camarote;


String get titulo {
  switch (this){
    case TipoIngresso.arquibancada:
    return 'Arquibancada';
    case TipoIngresso.cadeira:
    return 'Cadeira';
    case TipoIngresso.camarote:
    return 'Camarote';
  }
}

double get preco {
  switch (this){
    case TipoIngresso.arquibancada:
    return 50.00;
    case TipoIngresso.cadeira:
    return 90.00;
    case TipoIngresso.camarote:
    return 160;
  }
}
}