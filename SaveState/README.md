## Intro

Na maioria das vezes precisamos que o nosso programa salve alguma preferência ou o estado de algum componenete para execuções futuras. Em aplicações para o Android, a tarefa é muitop fácil utilizando o LAMW. Basta colocar o componenete jPreferences.

## jPreferences

 Os valores são armazenados no formato **chave=valor**.  Trabalha com cinco tipos de valores que são **Int** para valores inteiros, **Long** para inteiros de 64 bits, **Float** para números decimais, **Bool** para valores lógicos e **String** para cadeias de caracteres.

Utiliza-se **Set<tipo>Data(chave,valor)** para gravar um valor e **Get<tipo>Data(chave,default)** para ler um valor. 

## Programa

##### Tela

Foi colocado um componenet **jListView**, ocupando toda a tela **LayoutParamHeight** e **LayoutParamWidth** setados para **lpMatchParent**, **ItemLayout** com **layWidgetTextImage** para colocarmos uma widget no item e **WidgetItem** para **wgCheckBox**.






