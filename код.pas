const
  MAX_SIZE = 10;
type
  Node = record
    data: Integer;
    prev, next: ^Node;
  end;
var
  head: ^Node;
  tail: ^Node;

procedure InitList;
begin
  head := nil;
  tail := nil;
end;

procedure AddToEmptyList(data: Integer);
var
  newNode: ^Node;
begin
  New(newNode);
  newNode^.data := data;
  newNode^.prev := newNode;
  newNode^.next := newNode;
  head := newNode;
  tail := newNode;
end;

procedure AddToBeginning(data: Integer);
var
  newNode: ^Node;
begin
  New(newNode);
  newNode^.data := data;
  newNode^.prev := tail;
  newNode^.next := head;
  head^.prev := newNode;
  tail^.next := newNode;
  head := newNode;
end;

procedure AddToEnd(data: Integer);
var
  newNode: ^Node;
begin
  New(newNode);
  newNode^.data := data;
  newNode^.prev := tail;
  newNode^.next := head;
  tail^.next := newNode;
  head^.prev := newNode;
  tail := newNode;
end;

procedure DisplayList;
var
  current: ^Node;
begin
  if head = nil then
    writeln('Cписок пуст')
  else
  begin
    current := head;
    repeat
      writeln(current^.data);
      current := current^.next;
    until current = head;
  end;
end;

var
  choice, data: Integer;

begin
  InitList;

  repeat
    writeln();
    writeln('1. Добавить в начало');
    writeln('2. Добавить в конец');
    writeln('3. Отобразить список');
    writeln('4. Выход');
    write('Выберете номер: ');
    read(choice);

    case choice of
      1: begin
        writeln('Введите данные для добавления в начало: ');
        readln(data);
        if head = nil then
          AddToEmptyList(data)
        else
          AddToBeginning(data);
      end;
      2: begin
        writeln('Введите данные для добавления в конец: ');
        readln(data);
        if head = nil then
          AddToEmptyList(data)
        else
          AddToEnd(data);
      end;
      3: begin
        DisplayList;
      end;
      4: writeln('Выход...');
    end;
  until choice = 4;
end.
