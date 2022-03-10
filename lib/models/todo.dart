class Todo{
  int id;
  int userId;
  bool comleted;
  String title;
  Todo(int id, int userId,bool comleted,String title ){
this.id = id;
this.title = title;
this.userId = userId;
this.comleted = comleted;
  }
  Todo.fromjson(Map json){
    id = json["id"];
    userId = json["userId"];
    comleted = json["comleted"];
    title = json["title"];
  }
  Map tojson(){
    return{"id":id, "userId":userId, "comleted":comleted,"title": title};
  }
}