def blackPoint (start, next): 
    #Se saca la direccion de la recta, siendo tambien la distancia segun sus ejes
    dx = (next[0] - start[0])
    dy = (next[1] - start[1])

    #Se decide la distancia mas larga de los ejes X y Y
    D_max = max(abs(dx),abs(dy))
    print("dx ", dx)
    print("dy ", dy)
    print("max ", D_max)
    #max() obtendra el valor maximo de los argumentos que tenga dentro
    
    """Se calcula el incremento por cada paso, segun la distancia mas larga, siendo uno con un 
    incremento de 1, ya que se movera como en un triangulo dentro de la grafica de pixeles"""
    x_inc = dx/D_max
    y_inc = dy/D_max
    print("x_i ", x_inc)
    print("y_i ", y_inc)
    x,y=start #Inicializa las coordenas que se recorrera
    #Recorrera toda la recta de acuerdo al eje mas largo, con un rango de 0 hasta el eje mas largo
    for i in range(D_max): 
        #print(x,y)
        #Pueden valores flotantes pero se usan solo enteros para la verificacion
        x = x + x_inc #Incremento proporcional de las x
        y = y + y_inc #Incremento proporcional de las y
    

blackPoint((200,100),(20,20))

