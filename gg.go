package main //обьявление пакета в котором находится основная функция

import ( // импорт двух библиотек в котрых находятся файлы
	"fmt"     //fmt(форматированаый ввод.вывод )
	"strconv" //strconv (преобразование строк в числа и обратно )
)

func main() { // определение основной функции, все что находится в { }является телом функции
	for { //бесконечный цикл, все что находится в {} ,будет выполняться бесконечно пока не будет вызвана команда break

		_, num1, exit := input("Введите первое число: ", f) // данная строка вызывает функцию input с двумя параметрами ("Введите первое число: ", f) функция возвращает 3 значения  операцию. число и логическое значение  в данной строке мы присваеиваем значение  переменным num1 и exit
		`"_" означает, что мы не интересуемся первым значением, которое возвращает функция "input". Поэтому мы не присваиваем его никакой переменной.`
		if exit {
			`эта строка проверяет значение переменной "exit". Если оно равно "true", то выполняется команда "break", которая прерывает работу цикла.`
			break
		}

		op, _, exit := input("Введите операцию: ", op)
		if exit {
			break
		}

		_, num2, exit := input("Введите второе число: ", f)
		if exit {
			break
		}

		r, err := result(Extention{num1: num1, num2: num2, operation: op})
		if err != nil {
			fmt.Println(err)
			break
		}

		fmt.Println("Результат:", r)
	}
}

const ( //`эта строка объявляет две константы типа "string" с именами "op" и "f" и соответствующими значениями.`
	op string = "operation"
	f  string = "f"
)

type parser func(input string) (operation, float64, error) //строка объявляет тип "parser", который является функцией с одним параметром "input" типа "string" и тремя возвращаемыми значениями: "operation", число типа "float64" и ошибку.

func parseToFloat(input string) (operation, float64, error) { //строка объявляет функцию "parseToFloat", которая принимает один параметр "input" типа "string" и возвращает три значения: "operation", число типа "float64" и ошибку.
	value, err := strconv.ParseFloat(input, 64) //строка вызывает функцию "ParseFloat" из библиотеки "strconv". Эта функция пытается преобразовать строку "input" в число типа "float64". Если преобразование не удалось, то функция вернет ошибку. В противном случае, она вернет преобразованное число и значение "nil" в качестве ошибки. В данной строке мы присваиваем первое значение переменной "value", а второе - переменной "err".
	if err != nil {                             //строка проверяет, равно ли значение переменной "err" "nil". Если это так, то функция вернула ошибку. В этом случае, все, что находится в фигурных скобках, будет выполнено.
		return "", 0, fmt.Errorf("Ошибка: некорректное число %s", input) //строка возвращает три значения: пустую строку, ноль и ошибку, созданную с помощью функции "Errorf" из библиотеки "fmt". Эта функция позволяет создать строку с сообщением об ошибке, которая будет форматирована с помощью спецификаторов %s. В данном случае, функция вернет строку "Ошибка: некорректное число input", где "input" будет заменено на саму строку "input".
	}

	return "", value, nil //строка возвращает три значения: пустую строку, число "value" и значение "nil" в качестве ошибки. Если преобразование строки в число было успешным, то функция вернет эти значения.
}

func parseToOperation(input string) (operation, float64, error) {
	var value = operation(input)
	if value != plus && value != minus && value != multiply && value != divide {
		return "", 0, fmt.Errorf("Ошибка: неизвестная операция: %s", input)
	}
	return value, 0, nil
}

func getParser(typeValue string) parser {
	switch typeValue {
	case f:
		return parseToFloat
	case op:
		return parseToOperation
	}

	return nil
}

func input(message, typeValue string) (operation, float64, bool) {
	parser := getParser(typeValue)
	for {
		fmt.Print(message)
		var input string
		fmt.Scan(&input)

		if input == "q" {
			fmt.Println("Выход")
			return "", 0, true
		}

		operation, num, err := parser(input)
		if err != nil {
			fmt.Println(err)
			continue
		}

		return operation, num, false
	}
}

type operation string // строка объявляет новый тип "operation", который является строкой.

const ( //строка объявляет четыре константы типа "operation" с именами "plus", "minus", "multiply" и "divide" и соответствующими значениями
	plus     operation = "+"
	minus    operation = "-"
	multiply operation = "*"
	divide   operation = "/"
)

type Extention struct { //строка объявляет структуру с именем "Extention", которая содержит три поля: "num1" типа "float64", "num2" типа "float64" и "operation" типа "operation"
	num1      float64
	num2      float64
	operation operation
}

func result(ex Extention) (float64, error) { //строка объявляет функцию "result", которая принимает один параметр "ex" типа "Extention" и возвращает два значения: число типа "float64" и ошибку.

	var result float64    //строка объявляет переменную "result" типа "float64".
	switch ex.operation { //строка использует оператор "switch" для проверки значения поля "operation" у структуры "ex". В зависимости от этого значения, будет выполняться соответствующий код.
	case plus:
		result = ex.num1 + ex.num2 //строка выполняется, если значение поля "operation" равно "plus". В этом случае, переменная "result" присваивается сумма значений полей "num1" и "num2" у структуры "ex".
	case minus:
		result = ex.num1 - ex.num2
	case multiply:
		result = ex.num1 * ex.num2
	case divide:
		result = ex.num1 / ex.num2
	default:
		return 0, fmt.Errorf("Ошибка: неизвестная операция: %s", ex.operation)
	}

	return result, nil //строка возвращает значение переменной "result" и значение "nil" в качестве ошибки, что означает, что все операции были успешно выполнены.
}
