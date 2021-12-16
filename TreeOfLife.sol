//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.8.10;

contract TreeOfLife {

    address owner; // переменная, которая будет привязана к адресу создателя контракта
    address public addressPerson; //переменная для сохранения адреса добавляемого человека

    constructor() public {
        owner = msg.sender; //в переменную записываем адрес того, кто вызвал смарт-контракт
    }
    // структура с данными человека
    struct Person {
        string name; // имя
        string lastName; // фамилия
        string middleName; // отчество
        string dateOfBirth; // день рождения
        string familyMembers; // член семьи
    }
    // создадим массив структур
    mapping (string => Person) public persons;

   // Person[] public _persons;

    //функция добавления человека, принимает на вход значения name, lastName, middleName, dateOfBirth, familyMembers
    function setPerson(string memory name, string memory lastName, 
    string memory middleName, string memory dateOfBirth, string memory familyMembers) public {
        require(msg.sender == owner, "Not owner"); // проверка, является ли адрес того, кто выполняет контракт, пользователем, кто его создал
        persons[name] = Person(name, lastName, middleName, dateOfBirth, familyMembers); //создаем новую структуру человека
    }

    /*function setPerson(string memory _name, string memory _lastName, 
    string memory _middleName, string memory _dateOfBirth, string memory _familyMembers) public {
            require(msg.sender == owner, "Not owner"); // проверка, является ли адрес того, кто выполняет контракт, пользователем, кто его создал
            _persons.push(Person(_name, _lastName, _middleName, _dateOfBirth, _familyMembers));
            //addressPerson = msg.sender; //сохранение адреса человека
    }*/

    function editPerson(string memory name) public {
            require(msg.sender == owner, "Not owner"); // проверка, является ли адрес того, кто выполняет контракт, пользователем, кто его создал
            //вызвать функцию setPerson()
    }

    function deletePerson(string memory name) public {
            require(msg.sender == owner, "Not owner"); // проверка, является ли адрес того, кто выполняет контракт, пользователем, кто его создал
            delete persons[name];
    }


    //функция получения информации о человеке по имени
    function getPerson(string memory name) public view returns (string memory lastName, 
    string memory middleName, string memory dateOfBirth, string memory familyMembers) {
        require(msg.sender == owner, "Not owner");
        return (persons[name].lastName, persons[name].middleName, persons[name].dateOfBirth, persons[name].familyMembers);
    }
}
