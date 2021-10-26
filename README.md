﻿# AutomationOfDeploymentIB
Конфигурация предназначена для автоматизации выполнения основных операций над ИБ.

**ВАЖНО!** На данный момент конфигурация предусматривает работу только с файловыми базами. Серверные не запускаются, команды не выполняются!

Выполнение всех команд (конечно, кроме запуска ИБ и конфигуратора) происходит в фоновом режиме. Прогресс выполнения всех фоновых заданий выводится в РМ для работы с ИБ.

Если данная конфигурация развернта в файловом режиме, то есть ограничение: всегда выполняется только одно фоновое задание. Т.е. если последовательно запустить несколько команд/сценариев, все они будут иметь статус "Выполняется", однако по факту все задания добавляются в очередь и выполняются последовательно (но все-таки в фоновом режиме, т.е. с системой можно работать).

# Состав комплекта поставки
* **Работа с ИБ.dt** - демо база конфигурации по автоматизации работы с ИБ;
* **Автоматизация обменов** - папка содержит основные данные, необходимые для автоматизации настройки обменов:
	* **Конвертация данных 2.1 (пустая)** - пустая ИБ КД 2.1. Для удобства перед каждой настройкой обменов можно очищать КД, чтобы не было лишних данных;
	* **Описание структуры метаданных** - папка содержит адаптированные под работу с данной конфигурацией обработки из поставки КД 2.1 (добавлено получение параметров, переданных при запуске, автоматические запуск выполнения и завершение работы системы - см. команду "Запустить внешнюю обработку"):
		* **MD82Exp.epf/MD83Exp.epf** - обработки для выгрузки описания структуры метаданных конфигурации. Параметры обработки:
			* **ПутьКФайлуОписанияСтруктурыМетаданных** - файл, в который будет сохранена выгруженная структура описания метаданных;
			* **ЗавершитьРаботуСистемы** - 1 или 0. Признак необходимости завершения работы системы после выполнения обработки;
		* **ЗагрузкаОписанияСтруктурыМетаданных.epf** - обработка загрузки описания структуры метаданных конфигурации в КД 2.1;
	* **Подливаемые конфигурации** - папка сожержит подливаемые конфигурации и параметры объединения для автоматизации настройки обменов для ЕРП, ЗУП, УТ и УПП с системой 1С:ТОИР. Конфигурации представляют из себя полные копии подливаемых конфигураций из комплектов поставки системы 1С:ТОИР за исключением общих модулей и команд. Чтобы после объединение с подливаемой конфигурацией обмены были полностью готовы, добавляется общий модуль, в котором есть метод получения списка планов обмена, а также общие команды, связанные с обменами, для добавления в качестве типа параметра нашего плана обмена. Содержание папки:
		* **... .cf** - непосредственно сама подливаемая конфигурация;
		* **... .xml** - параметры объединения;
	* **Создание комплектов правил** - папка содержит правила регистрации/обмена, а также .bat файл, создающий на их основе комплекты правил. Состав каждой папки:
		* **build.cmd** - .bat файл создания комплектов правил;
		* **Rules** - папка содержит правила обмена и регистрации как для базы-источника, так и для базы приемника;
		* **toir, erp/zup/upp/ut** - папки сожержат комплекты правил (аналогичны тем, что идут в поставке 1С:ТОИР);

# Рабочее место для работы с ИБ
Основная форма для работы с системой.
Состоит из двух основных частей: дерево ИБ и команды, доступные для выполнения над ИБ.

Для всех команд, кроме создания ИБ, в качестве каталога ИБ (над какой базой выполняется команда) подтягивается каталог ИБ, выбранной в дереве без возможности изменить. Вручную указывается каталог в сценариях работы (см. соответсвующий пункт далее).

Так же общие параметры всех команд, кроме создания ИБ - Пользователь и Пароль выбранной ИБ, над которой будет выполняться команда.

## Создать ИБ
Создает в указанном каталоге новую пустуя информационную базу и добавляет ее в список существующих баз с заданным наименованием.

**ВАЖНО!** Если в каталоге уже находится какая-то ИБ (есть файл 1Cv8.CD) или в списке баз ранее была добавленабаза с аналогичным наименованием, то операция создания будет отменена на уровне платформы.

Есть возможность развернуть ИБ из шаблона (флаг создать из шаблона): файлы .cf и .dt. Первый соответствует варианту создания пустой ИБ из шаблона в стандартной окне запуска 1С, вторая - демо базе.

## Сделать резервную копию
Создает резервную копию (файл выгрузки .dt) и сохраняет в указанный файл.

## Восстановить из резервной копии
Восстанавливает ИБ из резервной копии (файл выгрузки .dt), хранящейся в указанном файле.
Пользователь и Пароль указывается непосредственно той базы, которая выбрана в дереве (не резервной копии)!

## Сохранить конфигурацию в файл
Сохраняет конфигурацию (файл .cf) в указанный файл.

## Загрузить конфигурацию из файла
Загружает конфигурацию (файл .cf), хранящююся в указанном файле.
Пользователь и Пароль указывается непосредственно той базы, которая выбрана в дереве!

## Объединить конфигурации
Выполняет объединение выбранной в дереве конфигурации с выбранным файлом.

Параметры команды:
* **Объединяемая конфигурация** - конфигурация, с которой нужно объединить выбранную.
* **Параметры объединения** - настройки объединения конфигурации, сохраненные, например, при интерактивном сравнении/объединении в конфигураторе. Без данного файла объединение будет отменено на уровне платформы.
* **Конфигурация из файла на поддержке** - При объединении конфигураций постановка на поддержку не происходит. Однако если конфигурация из файла находится на поддержке, то для выполнения операции необходимо явно указать это с помощью ключа -DisableSupport. Но если конфигурация из файла не на поддержке, то наоборот данный ключ нельзя указывать, иначе будет сообщение, что не обнаружено возможности постановки на поддержку (т.е. т.к. не на поддержке, то и снять нельзя).

## Обновить конфигурацию из хранилища
Позволяет обновить указанную ИБ из хранилища. Например, когда необходимо развернуть ИБ, находящуюся в разработке, для обмена: в данном случае будет получена актуальная версия конфигурации.
Дополнительно указываются адрес хранилища, а также пользователь и пароль для аутентификации.

## Сохранить конфигурацию хранилища в файл
Позволяет сохранить актуальную версию конфигурации из хранилища.
Дополнительно указываются адрес хранилища, а также пользователь и пароль для аутентификации, а также файл (.cf), в который необходимо сохранить конфигурацию.

## Отключить конфигурацию от хранилища
Позволяет отключить конфигурацию указанной ИБ от хранилища. Например, когда необходимо развернуть ИБ, находящуюся в разработке, для обмена: в данном случае после выгрузки ИБ, подключенной к хранилищу, и ее загрузки в новую ИБ, при запуске конфигуратора будет показано окно подключения к хранилищу. Для предотвращения этого после восстановления ИБ из резервной копии можно дополнительно отключить ее от хранилища.
Не нужно дополнительно указывать адрес хранилища, а также пользователь и пароль для аутентификации, т.к. подключения к хранилищу не происходит, а для отключения этих данных не нужно.

# Настройки системы
Основные параметры, необходимые для работы системы

## Режим отладки
Предназначен для вывода служебных сообщений платформы в указанный файл. Иногда это облегчает поиск ошибки. Например, можно забыть указать пользователя или пароль при выполнении команды, или при создании ИБ указать каталог, в котором развернута другая база. В этом случае по выведенным сообщениям легко решить проблему.

## Путь к файлу со списком ИБ
В данном файле хранится список ИБ, который выводится в стандартном окне запуска 1С. Используется для формирования дерева.

## Путь к приложению Обновлятор-1С
Использование данной программы не обязательно. Можно использовать, например, когда для обменов развернуты типовые конфигурации, и чтобы не разворачивать их заново можно выполнить обновление.

## Путь к 1С
Путь к 1С для запуска ИБ.

**ВАЖНО!** Для корректной работы фоновых заданий нужно указывать не запускатор 1С (C:\Program Files\1cv8\common\1cestart.exe), а приложение именно конкретной платформы (например, C:\Program Files\1cv8\8.3.18.1483\bin\1cv8.exe). УПП или КД 2.1, например, работать тоже будут.

# Сценарии работы
Позволяют объединять в себе описанные выше команды в произвольный алгоритм для выполнения различных действий. Добавлять можно как команды, так и другие сценарии, т.е. можно разбивать один процесс на несколько зависимых для удобства работы.

База из поставки является демо примером возможностей системы на примере настройки обменов для 1С:ТОИР и типовых конфигураций ЕРП, ЗУП, УТ и УПП.