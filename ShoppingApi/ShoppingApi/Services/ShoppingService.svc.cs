using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using ShoppingApi.Interfaces;
using ShoppingApi.Models;

namespace ShoppingApi.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ShoppingService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ShoppingService.svc or ShoppingService.svc.cs at the Solution Explorer and start debugging.
    public class ShoppingService : IShoppingService
    {
        static IDrinkRepository repository = new DrinkRepository();

        /// <summary>
        /// Get the list of drinks
        /// </summary>
        /// <returns></returns>
        public List<Drink> GetDrinkList()
        {
            return repository.GetAllDrinks();
        }

        /// <summary>
        /// Get a drink by using its ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Drink GetDrinkByID(string id)
        {
            try
            {
                return repository.GetDrinkByID(int.Parse(id));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Print("Unable to get drink (ID: " + id + "; full message: " + ex.Message);

                throw;
            }
        }

        /// <summary>
        /// Get a drink by using its Name
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public Drink GetDrinkByName(string name)
        {
            try
            {
                return repository.GetDrinkByName(name);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Print("Unable to get drink (Name: " + name + "; full message: " + ex.Message);

                throw;
            }
        }

        /// <summary>
        /// Add a drink
        /// </summary>
        /// <param name="drink"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public string AddDrink(Drink drink, string id)
        {
            Drink _drink = repository.AddNewDrink(drink);

            return "Drink (ID: " + _drink.ID + ") has been created.";
        }

        /// <summary>
        /// Update a drink
        /// </summary>
        /// <param name="drink"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public string UpdateDrink(Drink drink, string id)
        {
            bool updated = repository.UpdateADrink(drink);

            if (updated)
                return "Drink (ID: " + id + ") has been updated to " + drink.Name + " with a quantity of " + drink.Quantity + ".";
            else
                return "Unable to update drink (ID: " + id + ".";
        }

        /// <summary>
        /// Delete a drink
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string DeleteDrink(string id)
        {
            bool deleted = repository.DeleteADrink(int.Parse(id));

            if (deleted)
                return "Drink (ID: " + id + ") has been deleted.";
            else
                return "Unable to delete drink (ID: " + id + ".";
        }
    }
}