const
  max_size = 10;
type
  node = record
    data: integer;
    prev, next: integer;
  end;
var
  head: integer;
  tail: integer;
  nodes: array[1..max_size] of node;
  free_node: integer;

procedure initlist;
var
  i: integer;
begin
  head := 0;
  tail := 0;
  free_node := 1;
  
  for i := 1 to max_size do
  begin
    nodes[i].prev := 0;
    nodes[i].next := 0;
  end;
end;

procedure addtoemptylist(data: integer);
begin
  nodes[free_node].data := data;
  head := free_node;
  tail := free_node;
  free_node := free_node + 1;
end;

procedure addtobeginning(data: integer);
begin
  nodes[free_node].data := data;
  nodes[free_node].next := head;
  nodes[free_node].prev := tail;
  nodes[head].prev := free_node;
  nodes[tail].next := free_node;
  head := free_node;
  free_node := free_node + 1;
end;

procedure addtoend(data: integer);
begin
  nodes[free_node].data := data;
  nodes[free_node].next := head;
  nodes[free_node].prev := tail;
  nodes[tail].next := free_node;
  nodes[head].prev := free_node;
  tail := free_node;
  free_node := free_node + 1;
end;

procedure displaylist;
var
  current: integer;
begin
  if head = 0 then
    writeln('список пуст')
  else
  begin
    current := head;
    repeat
      writeln(nodes[current].data);
      current := nodes[current].next;
    until current = head;
  end;
end;

procedure deletefrombeginning;
begin
  if head = 0 then
    writeln('Список пуст')
  else
  begin
    if head = tail then
    begin
      head := 0;
      tail := 0;
    end
    else
    begin
      head := nodes[head].next;
      nodes[head].prev := tail;
      nodes[tail].next := head;
    end;
  end;
end;

procedure deletefromend;
begin
  if head = 0 then
    writeln('Список пуст')
  else
  begin
    if head = tail then
    begin
      head := 0;
      tail := 0;
    end
    else
    begin
      tail := nodes[tail].prev;
      nodes[tail].next := head;
      nodes[head].prev := tail;
    end;
  end;
end;

var
  choice, data: integer;

begin
  initlist;

  repeat
    writeln();
    writeln('1. добавить в начало');
    writeln('2. добавить в конец');
    writeln('3. удалить из начала');
    writeln('4. удалить из конца');
    writeln('5. отобразить список');
    writeln('6. выход');
    write('выберете номер: ');
    read(choice);

    case choice of
      1: begin
        writeln('введите данные для добавления в начало: ');
        readln(data);
        if head = 0 then
          addtoemptylist(data)
        else
          addtobeginning(data);
      end;
      2: begin
        writeln('введите данные для добавления в конец: ');
        readln(data);
        if head = 0 then
          addtoemptylist(data)
        else
          addtoend(data);
      end;
      3: begin
        deletefrombeginning;
      end;
      4: begin
        deletefromend;
      end;
      5: begin
        displaylist;
      end;
      6: writeln('выход...');
    end;
  until choice = 6;
end.
