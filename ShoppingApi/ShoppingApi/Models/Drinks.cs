using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Runtime.Serialization;
using System.Web;

namespace ShoppingApi.Models
{
    [DataContract]
    public class Drink
    {
        [DataMember]
        public int ID { get; set; }

        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public int Quantity { get; set; }
    }

    public interface IDrinkRepository
    {
        List<Drink> GetAllDrinks();

        Drink GetDrinkByID(int id);
        Drink GetDrinkByName(string name);
        Drink AddNewDrink(Drink item);

        bool DeleteADrink(int id);
        bool UpdateADrink(Drink item);
    }

    public class DrinkRepository : IDrinkRepository
    {
        private List<Drink> drinks = new List<Drink>();

        private int counter = 1;

        public DrinkRepository()
        {
            AddNewDrink(new Drink { Name = "Pepsi", Quantity = 1 });
            AddNewDrink(new Drink { Name = "Coca Cola", Quantity = 2 });
            AddNewDrink(new Drink { Name = "Still Water", Quantity = 3 });
            AddNewDrink(new Drink { Name = "Diet Pepsi", Quantity = 4 });
            AddNewDrink(new Drink { Name = "Coke Zero", Quantity = 5 });
            AddNewDrink(new Drink { Name = "Sparkling Water", Quantity = 6 });
            AddNewDrink(new Drink { Name = "Americano", Quantity = 7 });
            AddNewDrink(new Drink { Name = "Cappucino", Quantity = 8 });
            AddNewDrink(new Drink { Name = "Mocha", Quantity = 9 });
            AddNewDrink(new Drink { Name = "Black Tea", Quantity = 10 });
            AddNewDrink(new Drink { Name = "Green Tea", Quantity = 11 });
            AddNewDrink(new Drink { Name = "Raspberry Infusion", Quantity = 11 });
        }

        public Drink AddNewDrink(Drink _new)
        {
            if (_new == null)
                throw new ArgumentNullException("_new");

            _new.ID = counter++;

            drinks.Add(_new);

            return _new;
        }

        public List<Drink> GetAllDrinks()
        {
            return drinks;
        }

        public Drink GetDrinkByID(int id)
        {
            return drinks.Find(b => b.ID == id);
        }

        public Drink GetDrinkByName(string name)
        {
            return drinks.Find(b => b.Name == name);
        }

        public bool UpdateADrink(Drink _update)
        {
            if (_update == null)
                throw new ArgumentNullException("_update");

            int idx = drinks.FindIndex(b => b.ID == _update.ID);

            if (idx == -1)
                return false;

            drinks.RemoveAt(idx);
            drinks.Add(_update);

            return true;
        }

        public bool DeleteADrink(int id)
        {
            int idx = drinks.FindIndex(b => b.ID == id);

            if (idx == -1)
                return false;

            drinks.RemoveAll(b => b.ID == id);

            return true;
        }
    }
}