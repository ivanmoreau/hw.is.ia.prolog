:- use_module(library(pce)).
:- pce_image_directory('./imagenes').

% Metodo para llamar a una imagen con un nombre especifico
resource(portada, image, image('portada.jpg')).

% Ventana principal para la portada
inicio :- 
	new(@interfaz, dialog('Bienvenido al Sistema Experto')),
	send(@interfaz, size, size(630,400)),
	% mostrar_imagen(@interfaz, portada), % Llama al metodo mostrar imagen
	new(BotonComenzar, button('Iniciar programa', 
		and(message(@prolog, main), 
		and(message(@interfaz, destroy), message(@interfaz, free)) ))),
	new(BotonSalir, button('Salir',
		and(message(@interfaz, destroy), message(@interfaz, free)) )),
	new(TextoAutores, text('Autores: Gustavo Iván Molina Rebolledo, Cesar Antonio Castro Sotelo, Alejandro Tonatiuh Garcia Espinoza')),
	new(TextoDescripcion, text('Descripcion: Dada la situación actual de la escacez del agua, el presente sistema experto tiene como objetivo')),
	new(TextoDescripcion2, text('proponer alimentos alternativos que requieran menor cantidad de agua para su producción.')),
	send(@interfaz, append(BotonComenzar)),
	send(@interfaz, append(BotonSalir)),
	send(@interfaz, append(TextoAutores)),
	send(@interfaz, append(TextoDescripcion)),
	send(@interfaz, append(TextoDescripcion2)),
	send(@interfaz, display, BotonComenzar, point(150,100)),
	send(@interfaz, display, BotonSalir, point(400,100)),
	send(@interfaz, display, TextoAutores, point(50, 50)),
	send(@interfaz, display, TextoDescripcion, point(50, 65)),
	send(@interfaz, display, TextoDescripcion2, point(50, 75)),
	send(@interfaz, open_centered).


% Ventana secundaria
main :-
	new(D, dialog('Sistema experto - menu')),
  
	new(BotonCarnes, button('Carnes',
		and(message(@prolog, carnes),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonCereales, button('Cereales',
		and(message(@prolog, cereales),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonVerduras, button('Verduras',
		and(message(@prolog, verduras),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonFrutas, button('Frutas',
		and(message(@prolog, frutas),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonBebidas, button('Bebidas',
		and(message(@prolog, bebidas),
		and(message(D, destroy), message(D, free))))),
  
	send(D, append, new(BTS, dialog_group(buttons, group))),
  
	send(BTS, append, BotonCarnes),
  
	send(BTS, append, BotonCereales),
  
	send(BTS, append, BotonVerduras),
  
	send(BTS, append, BotonFrutas),
  
	send(BTS, append, BotonBebidas),
  
	send(D, open_centered).

% Metodo para mostrar imagen
mostrar_imagen(Pantalla, Imagen) :-
	new(Figura, figure),
	new(Bitmap, bitmap(resource(Imagen),@on)),
	send(Bitmap, name, 1),
	send(Figura, display, Bitmap),
	send(Figura, status, 1),
	send(Pantalla, display, Figura, point(10,30)).






% Menú de Carnes
carnes :-
	new(D, dialog('Sistema experto - Carnes')),
  
	new(BotonRes, button('Res',
		and(message(@prolog, res),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonPollo, button('Pollo',
		and(message(@prolog, pollo),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonCerdo, button('Cerdo',
		and(message(@prolog, cerdo),
		and(message(D, destroy), message(D, free))))),
  
	send(D, append, new(BTS, dialog_group(buttons, group))),
  
	send(BTS, append, BotonRes),
  
	send(BTS, append, BotonPollo),
  
	send(BTS, append, BotonCerdo),
  
	send(D, open_centered).
% Menú de Verduras
verduras :-
	new(D, dialog('Sistema experto - Verduras')),
  
	new(BotonCol, button('Col',
		and(message(@prolog, col),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonPapa, button('Papa',
		and(message(@prolog, papa),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonJitomate, button('Jitomate',
		and(message(@prolog, jitomate),
		and(message(D, destroy), message(D, free))))),
  
	send(D, append, new(BTS, dialog_group(buttons, group))),
  
	send(BTS, append, BotonCol),
  
	send(BTS, append, BotonPapa),
  
	send(BTS, append, BotonJitomate),
  
	send(D, open_centered).
% Menú de Cereales
cereales :-
	new(D, dialog('Sistema experto - Cereales')),
  
	new(BotonArroz, button('Arroz',
		and(message(@prolog, arroz),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonPan, button('Pan',
		and(message(@prolog, pan),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonPasta, button('Pasta',
		and(message(@prolog, pasta),
		and(message(D, destroy), message(D, free))))),
  
	send(D, append, new(BTS, dialog_group(buttons, group))),
  
	send(BTS, append, BotonArroz),
  
	send(BTS, append, BotonPan),
  
	send(BTS, append, BotonPasta),
  
	send(D, open_centered).
% Menú de Frutas
frutas :-
	new(D, dialog('Sistema experto - Frutas')),
  
	new(BotonManzana, button('Manzana',
		and(message(@prolog, manzana),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonPlatano, button('Platano',
		and(message(@prolog, platano),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonAceituna, button('Aceituna',
		and(message(@prolog, aceituna),
		and(message(D, destroy), message(D, free))))),
  
	send(D, append, new(BTS, dialog_group(buttons, group))),
  
	send(BTS, append, BotonManzana),
  
	send(BTS, append, BotonPlatano),
  
	send(BTS, append, BotonAceituna),
  
	send(D, open_centered).
% Menú de Bebidas
bebidas :-
	new(D, dialog('Sistema experto - Bebidas')),
  
	new(BotonVino, button('Vino',
		and(message(@prolog, vino),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonLeche, button('Leche',
		and(message(@prolog, leche),
		and(message(D, destroy), message(D, free))))),
  
	new(BotonCerveza, button('Cerveza',
		and(message(@prolog, cerveza),
		and(message(D, destroy), message(D, free))))),
  
	send(D, append, new(BTS, dialog_group(buttons, group))),
  
	send(BTS, append, BotonVino),
  
	send(BTS, append, BotonLeche),
  
	send(BTS, append, BotonCerveza),
  
	send(D, open_centered).


% Carnes
comida('Carne de res', 15415, nutricion(6.36, 0, 27.7, 168), '2.2 años', '4-12 meses congelado').
comida('Carne de pollo', 4325, nutricion(3.24, 0, 32.1, 158), '49 dias', '12 meses congelado').
comida('Carne de puerco', 5988, nutricion(9.04, 15.8, 7.38, 174), '23 - 25 semanas', '4-12 meses congelado').
% Cereales
comida('Arroz', 2497, nutricion(1.3, 79.8, 6.94, 369), '95-250 dias', '2 años sin abrir').
comida('Pan', 1608, nutricion(1.65, 72.8, 14.3, 158), '49 dias', '12 meses congelado').
comida('Pasta (seca)', 1849, nutricion(2.73, 72.1, 15.1, 370), '140 dias', '2 años sin abrir').
% Verduras
comida('Col', 237, nutricion(0.1, 5.8, 1.28, 25), '110-130 dias', '10-12 semanas congelado').
comida('Papa', 287, nutricion(0.95, 79.9, 8.11, 361), '115 dias', '10-12 semanas congelado').
comida('Jitomate', 214, nutricion(0.42, 3.84, 0.7, 22), '70-80 dias', '2 meses congelado').
% Frutas
comida('Manzana', 822, nutricion(0.15, 14.8, 0.13, 61), '131-148 dias', '8 meses congelado').
comida('Platano', 790, nutricion(0.29, 23, 0.74, 98), '65-90 dias', '10-12 meses congelado').
comida('Aceituna', 3025, nutricion(12.9, 4.96, 1.15, 141), '1 año', '2 semanas').
% Bebidas
comida('Vino', 109, nutricion(0, 1.15, 0.07, 49), '10-14 días de fermentación', '3-5 años sin abrir').
comida('Leche', 255, nutricion(3.2, 4.63, 3.27, 61), '305 días de ordeño', '1-3 meses refrigerado sin abrir').
comida('Cerveza', 74, nutricion(0, 3.55, 0.46, 43), '4-7 dias de fermentación', '4 meses').


% Si Y se acerca a X con un margen de Z, entonces tiene caracteristicas similares.
similar(X, Y, Z) :- (X < Y + Z,!); X > Y - Z.

recomendacion(X, Y) :- comida(X,A1,nutricion(F1,CH1,P1,C1),_,_), comida(Y,A2,nutricion(F2,CH2,P2,C2),_,_), A2 < A1, 
	similar(F1, F2, 5), similar(CH1, CH2, 5), similar(P1, P2, 5), similar(C1, C2, 15).  

% save all Y recomendaciones for X in a list
recomendaciones(X, Y) :- findall(Z, recomendacion(X, Z), Y).

res :-
	new(D, dialog('Sistema experto - Carne de res')),
  new(TextoTitulo, text('Información sobre Carne de res')),
	comida('Carne de res', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
pollo :-
	new(D, dialog('Sistema experto - Carne de pollo')),
  new(TextoTitulo, text('Información sobre Carne de pollo')),
	comida('Carne de pollo', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
cerdo :-
	new(D, dialog('Sistema experto - Carne de puerco')),
  new(TextoTitulo, text('Información sobre Carne de puerco')),
	comida('Carne de puerco', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
arroz :-
	new(D, dialog('Sistema experto - Arroz')),
  new(TextoTitulo, text('Información sobre Arroz')),
	comida('Arroz', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
pan :-
	new(D, dialog('Sistema experto - Pan')),
  new(TextoTitulo, text('Información sobre Pan')),
	comida('Pan', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
pasta :-
	new(D, dialog('Sistema experto - Pasta (seca)')),
  new(TextoTitulo, text('Información sobre Pasta (seca)')),
	comida('Pasta (seca)', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
col :-
	new(D, dialog('Sistema experto - Col')),
  new(TextoTitulo, text('Información sobre Col')),
	comida('Col', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
papa :-
	new(D, dialog('Sistema experto - Papa')),
  new(TextoTitulo, text('Información sobre Papa')),
	comida('Papa', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
jitomate :-
	new(D, dialog('Sistema experto - Jitomate')),
  new(TextoTitulo, text('Información sobre Jitomate')),
	comida('Jitomate', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
manzana :-
	new(D, dialog('Sistema experto - Manzana')),
  new(TextoTitulo, text('Información sobre Manzana')),
	comida('Manzana', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
platano :-
	new(D, dialog('Sistema experto - Platano')),
  new(TextoTitulo, text('Información sobre Platano')),
	comida('Platano', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
aceituna :-
	new(D, dialog('Sistema experto - Aceituna')),
  new(TextoTitulo, text('Información sobre Aceituna')),
	comida('Aceituna', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
vino :-
	new(D, dialog('Sistema experto - Vino')),
  new(TextoTitulo, text('Información sobre Vino')),
	comida('Vino', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
leche :-
	new(D, dialog('Sistema experto - Leche')),
  new(TextoTitulo, text('Información sobre Leche')),
	comida('Leche', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).
cerveza :-
	new(D, dialog('Sistema experto - Cerveza')),
  new(TextoTitulo, text('Información sobre Cerveza')),
	comida('Cerveza', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida),
  string_concat('Agua: ', Agua, AguaStr),
	new(TextoAgua, text(AguaStr)),
  string_concat('Grasa: ', Grasa, GrasaStr),
	new(TextoGrasa, text(GrasaStr)),
  string_concat('Carbohidratos: ', Carbohidratos, CarbohidratosStr),
	new(TextoCarbohidratos, text(CarbohidratosStr)),
  string_concat('Proteina: ', Proteina, ProteinaStr),
	new(TextoProteina, text(ProteinaStr)),
  string_concat('Calorias: ', Calorias, CaloriasStr),
	new(TextoCalorias, text(CaloriasStr)),
  string_concat('Tiempo de produccion: ', TProducion, TProducionStr),
	new(TextoTProducion, text(TProducionStr)),
  string_concat('Tiempo de vida: ', TVida, TVidaStr),
	new(TextoTVida, text(TVidaStr)),
  new(BotonRegresar, button('Regresar',
    and(message(@prolog, main),
    and(message(D, destroy), message(D, free))))),
  send(D, append, TextoTitulo),
	send(D, append(TextoAgua)),
	send(D, append(TextoGrasa)),
	send(D, append(TextoCarbohidratos)),
	send(D, append(TextoProteina)),
	send(D, append(TextoCalorias)),
	send(D, append(TextoTProducion)),
	send(D, append(TextoTVida)),
  send(D, append, BotonRegresar),
	send(D, open_centered).