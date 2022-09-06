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
  {% for tipo in ['Carnes', 'Cereales', 'Verduras', 'Frutas', 'Bebidas'] %}
	new(Boton{{ tipo }}, button('{{ tipo }}',
		and(message(@prolog, {{ tipo.lower() }}),
		and(message(D, destroy), message(D, free))))),
  {% endfor %}
	send(D, append, new(BTS, dialog_group(buttons, group))),
  {% for tipo in ['Carnes', 'Cereales', 'Verduras', 'Frutas', 'Bebidas'] %}
	send(BTS, append, Boton{{ tipo }}),
  {% endfor %}
	send(D, open_centered).

% Metodo para mostrar imagen
mostrar_imagen(Pantalla, Imagen) :-
	new(Figura, figure),
	new(Bitmap, bitmap(resource(Imagen),@on)),
	send(Bitmap, name, 1),
	send(Figura, display, Bitmap),
	send(Figura, status, 1),
	send(Pantalla, display, Figura, point(10,30)).

{% macro submenu(catstr, buttons) -%}
% Menú de {{ catstr }}
{{ catstr.lower() }} :-
	new(D, dialog('Sistema experto - {{ catstr }}')),
  {% for button in buttons %}
	new(Boton{{ button }}, button('{{ button }}',
		and(message(@prolog, {{ button.lower() }}),
		and(message(D, destroy), message(D, free))))),
  {% endfor %}
	send(D, append, new(BTS, dialog_group(buttons, group))),
  {% for button in buttons %}
	send(BTS, append, Boton{{ button }}),
  {% endfor %}
	send(D, open_centered).
{%- endmacro %}

{% macro foodinfo(fooddef, foodstr) -%}
{{ fooddef }} :-
	new(D, dialog('Sistema experto - {{ foodstr }}')),
  new(TextoTitulo, text('Información sobre {{ foodstr }}')),
	comida('{{ foodstr }}', Agua, nutricion(Grasa, Carbohidratos, Proteina, Calorias), TProducion, TVida, Metodo),
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
  % button for recomendations
  new(BotonRecomendaciones, button('Recomendaciones',
    new(D2, dialog('Sistema experto - Recomendaciones para {{ foodstr }}')))),
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
{%- endmacro %}


{{ submenu('Carnes', ['Res', 'Pollo', 'Cerdo']) }}
{{ submenu('Verduras', ['Col', 'Papa', 'Jitomate']) }}
{{ submenu('Cereales', ['Arroz', 'Pan', 'Pasta']) }}
{{ submenu('Frutas', ['Manzana', 'Platano', 'Aceituna']) }}
{{ submenu('Bebidas', ['Vino', 'Leche', 'Cerveza']) }}


% Carnes
comida('Carne de res', 15415, nutricion(6.36, 0, 27.7, 168), '2.2 años', '4-12 meses congelado', res).
comida('Carne de pollo', 4325, nutricion(3.24, 0, 32.1, 158), '49 dias', '12 meses congelado', pollo).
comida('Carne de puerco', 5988, nutricion(9.04, 15.8, 7.38, 174), '23 - 25 semanas', '4-12 meses congelado', puerco).
% Cereales
comida('Arroz', 2497, nutricion(1.3, 79.8, 6.94, 369), '95-250 dias', '2 años sin abrir', arroz).
comida('Pan', 1608, nutricion(1.65, 72.8, 14.3, 158), '49 dias', '12 meses congelado', pan).
comida('Pasta (seca)', 1849, nutricion(2.73, 72.1, 15.1, 370), '140 dias', '2 años sin abrir', pasta).
% Verduras
comida('Col', 237, nutricion(0.1, 5.8, 1.28, 25), '110-130 dias', '10-12 semanas congelado', col).
comida('Papa', 287, nutricion(0.95, 79.9, 8.11, 361), '115 dias', '10-12 semanas congelado', papa).
comida('Jitomate', 214, nutricion(0.42, 3.84, 0.7, 22), '70-80 dias', '2 meses congelado', jitomate).
% Frutas
comida('Manzana', 822, nutricion(0.15, 14.8, 0.13, 61), '131-148 dias', '8 meses congelado', manzana).
comida('Platano', 790, nutricion(0.29, 23, 0.74, 98), '65-90 dias', '10-12 meses congelado', platano).
comida('Aceituna', 3025, nutricion(12.9, 4.96, 1.15, 141), '1 año', '2 semanas', aceituna).
% Bebidas
comida('Vino', 109, nutricion(0, 1.15, 0.07, 49), '10-14 días de fermentación', '3-5 años sin abrir', vino).
comida('Leche', 255, nutricion(3.2, 4.63, 3.27, 61), '305 días de ordeño', '1-3 meses refrigerado sin abrir', leche).
comida('Cerveza', 74, nutricion(0, 3.55, 0.46, 43), '4-7 dias de fermentación', '4 meses', cerveza).


% Si Y se acerca a X con un margen de Z, entonces tiene caracteristicas similares.
similar(X, Y, Z) :- (X < Y + Z,!); X > Y - Z.

recomendacion(X, Y) :- comida(X,A1,nutricion(F1,CH1,P1,C1),_,_,_), comida(Y,A2,nutricion(F2,CH2,P2,C2),_,_,_), A2 < A1, 
	similar(F1, F2, 5), similar(CH1, CH2, 5), similar(P1, P2, 5), similar(C1, C2, 15).  

% save all Y recomendaciones for X in a list
recomendaciones(X, Y) :- findall(Z, recomendacion(X, Z), Y).

{{ foodinfo('res', 'Carne de res') }}
{{ foodinfo('pollo', 'Carne de pollo') }}
{{ foodinfo('cerdo', 'Carne de puerco') }}
{{ foodinfo('arroz', 'Arroz') }}
{{ foodinfo('pan', 'Pan') }}
{{ foodinfo('pasta', 'Pasta (seca)') }}
{{ foodinfo('col', 'Col') }}
{{ foodinfo('papa', 'Papa') }}
{{ foodinfo('jitomate', 'Jitomate') }}
{{ foodinfo('manzana', 'Manzana') }}
{{ foodinfo('platano', 'Platano') }}
{{ foodinfo('aceituna', 'Aceituna') }}
{{ foodinfo('vino', 'Vino') }}
{{ foodinfo('leche', 'Leche') }}
{{ foodinfo('cerveza', 'Cerveza') }}
