import { Model } from "@/model/utils";
import { Catalog, InterfaceWithModels, Item } from "@/types";
import { Map } from "immutable";
import { sq } from "@quri/squiggle-lang";

// Note: Much of this was generated by this file:
// https://observablehq.com/d/98cbe0073226a5f9

function getCatalog(): Catalog {
  const items: Item[] = [
    {
      id: "funder_openphil_2020",
      clusterId: "funder",
      name: "$1 Open Philanthropy - 2020 (longtermism)",
      description:
        "The marginal value of $1, from Open Philanthropy longtermism, in the year 2020",
    },
    {
      id: "funder_openphil_2023",
      clusterId: "funder",
      name: "$1 Open Philanthropy - 2023 (longtermism)",
      description:
        "The marginal value of $1, from Open Philanthropy longtermism, in the year 2023",
    },
    {
      id: "funder_eafund_ltff_2020",
      clusterId: "funder",
      name: "$1 Long-Term Future Fund (EA Funds) - 2020",
      description:
        "The marginal value of $1, from Long-Term Future Fund (EA Funds), in the year 2020",
    },
    {
      id: "funder_eafund_ltff_2023",
      clusterId: "funder",
      name: "$1 Long-Term Future Fund (EA Funds) - 2023",
      description:
        "The marginal value of $1, from Long-Term Future Fund (EA Funds), in the year 2023",
    },
    {
      id: "funder_eafund_animal_welfare_2020",
      clusterId: "funder",
      name: "$1 Animal Fund (EA Funds) - 2020",
      description:
        "The marginal value of $1, from Long-Term Future Fund (EA Funds), in the year 2020",
    },
    {
      id: "funder_eafund_animal_welfare_2023",
      clusterId: "funder",
      name: "$1 Animal Fund (EA Funds) - 2023",
      description:
        "The marginal value of $1, from Long-Term Future Fund (EA Funds), in the year 2023",
    },
    {
      id: "funder_eafund_ea_infrastructure_2020",
      clusterId: "funder",
      name: "$1 EA Infrastructure Fund (EA Funds) - 2020",
      description:
        "The marginal value of $1, from EA Infrastructure Fund (EA Funds), in the year 2020",
    },
    {
      id: "funder_eafund_ea_infrastructure_2023",
      clusterId: "funder",
      name: "$1 EA Infrastructure Fund (EA Funds) - 2023",
      description:
        "The marginal value of $1, from EA Infrastructure Fund (EA Funds), in the year 2023",
    },
    {
      id: "funder_eafund_globalhealth_2020",
      clusterId: "funder",
      name: "$1 Global Health and Development (EA Funds) - 2020",
      description:
        "The marginal value of $1, from Global Health and Development (EA Funds), in the year 2020. Consider flow-though impacts, like longtermist benefits.",
    },
    {
      id: "funder_eafund_globalhealth_2020_direct",
      clusterId: "funder",
      name: "$1 Global Health and Development (EA Funds) (Direct Impacts) - 2020",
      description:
        "The marginal value of $1, from Global Health and Development (EA Funds), in the year 2020. Only consider direct impacts.",
    },
    {
      id: "macrovariable_microdoom",
      clusterId: "macrovariables",
      name: "1 Microdoom",
    },
    {
      id: "macrovariable_microtopia",
      clusterId: "macrovariables",
      name: "1 Microtopia",
      description: "",
    },
    {
      id: "macrovariable_universal_microtopia",
      clusterId: "macrovariables",
      name: "1 Universal Microtopia",
    },
    {
      id: "macrovariable_microhell",
      clusterId: "macrovariables",
      name: "1 Microhell",
      description: "",
    },
    {
      id: "macrovariable_universal_microhell",
      clusterId: "macrovariables",
      name: "1 Universal Microhell",
      description: "",
    },
    {
      id: "sentientWelfare_human_qaly",
      name: "Human QALY",
      description: "1 Quality Average Life Year of a Human",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_human_life",
      name: "Human Life",
      description: "1 Year of Life of a Human",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_cow_qaly",
      name: "Cow QALY",
      description: "1 Quality Average Life Year of a Cow",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_cow_life",
      name: "Cow Life",
      description: "1 Year of Life of a Cow",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_cow_farmed_life",
      name: "Cow Farmed Life",
      description:
        "1 Year of Life of a Cow raised for food. It's assumed it's a factory farm or similar.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_cow_farmed_animal_cal_100",
      name: "Cow 100 Cal of Food",
      description:
        "100 calories of Cow meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_cow_farmed_animal_lb_1",
      name: "Cow 1lb Meat",
      description:
        "1 pound of Cow meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_pig_qaly",
      name: "Pig QALY",
      description: "1 Quality Average Life Year of a Pig",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_pig_life",
      name: "Pig Life",
      description: "1 Year of Life of a Pig",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_pig_farmed_life",
      name: "Pig Farmed Life",
      description:
        "1 Year of Life of a Pig raised for food. It's assumed it's a factory farm or similar.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_pig_farmed_animal_cal_100",
      name: "Pig 100 Cal of Food",
      description:
        "100 calories of Pig meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_pig_farmed_animal_lb_1",
      name: "Pig 1lb Meat",
      description:
        "1 pound of Pig meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_chicken_qaly",
      name: "Chicken QALY",
      description: "1 Quality Average Life Year of a Chicken",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_chicken_life",
      name: "Chicken Life",
      description: "1 Year of Life of a Chicken",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_chicken_farmed_life",
      name: "Chicken Farmed Life",
      description:
        "1 Year of Life of a Chicken raised for food. It's assumed it's a factory farm or similar.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_chicken_farmed_animal_cal_100",
      name: "Chicken 100 Cal of Food",
      description:
        "100 calories of Chicken meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_chicken_farmed_animal_lb_1",
      name: "Chicken 1lb Meat",
      description:
        "1 pound of Chicken meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_turkey_qaly",
      name: "Turkey QALY",
      description: "1 Quality Average Life Year of a Turkey",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_turkey_life",
      name: "Turkey Life",
      description: "1 Year of Life of a Turkey",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_turkey_farmed_life",
      name: "Turkey Farmed Life",
      description:
        "1 Year of Life of a Turkey raised for food. It's assumed it's a factory farm or similar.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_turkey_farmed_animal_cal_100",
      name: "Turkey 100 Cal of Food",
      description:
        "100 calories of Turkey meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_turkey_farmed_animal_lb_1",
      name: "Turkey 1lb Meat",
      description:
        "1 pound of Turkey meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_salmon_qaly",
      name: "Salmon QALY",
      description: "1 Quality Average Life Year of a Salmon",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_salmon_life",
      name: "Salmon Life",
      description: "1 Year of Life of a Salmon",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_salmon_farmed_life",
      name: "Salmon Farmed Life",
      description:
        "1 Year of Life of a Salmon raised for food. It's assumed it's a factory farm or similar.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_salmon_farmed_animal_cal_100",
      name: "Salmon 100 Cal of Food",
      description:
        "100 calories of Salmon meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_salmon_farmed_animal_lb_1",
      name: "Salmon 1lb Meat",
      description:
        "1 pound of Salmon meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_shrimp_qaly",
      name: "Shrimp QALY",
      description: "1 Quality Average Life Year of a Shrimp",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_shrimp_life",
      name: "Shrimp Life",
      description: "1 Year of Life of a Shrimp",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_shrimp_farmed_life",
      name: "Shrimp Farmed Life",
      description:
        "1 Year of Life of a Shrimp raised for food. It's assumed it's a factory farm or similar.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_shrimp_farmed_animal_cal_100",
      name: "Shrimp 100 Cal of Food",
      description:
        "100 calories of Shrimp meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
    {
      id: "sentientWelfare_shrimp_farmed_animal_lb_1",
      name: "Shrimp 1lb Meat",
      description:
        "1 pound of Shrimp meat. It's assumed the animal was raised for food.",
      clusterId: "sentientWelfare",
    },
  ];

  return {
    id: "macrovariables",
    title: "Macrovariables",
    items,
    recommendedUnit: "funder_openphil_2020",
    clusters: {
      macrovariables: {
        name: "macrovariables",
        color: "#DB828C",
        recommendedUnit: "macrovariable_microtopia",
      },
      funder: {
        name: "funder",
        color: "#3B42aC",
        recommendedUnit: "funder_openphil_2020",
      },
      sentientWelfare: {
        name: "Sentient Welfare",
        color: "#5Bc28C",
        recommendedUnit: "sentientWelfare_cow_qaly",
      },
    },
  };
}

function getTextModel(): Model {
  return {
    id: "Macrovariables",
    title: "Macrovariables",
    author: "Ozzie Gooen",
    mode: "text",
    code: sq`
    //Trying having one file here, to see if that makes editing easier. Will later move this around with some script or similar.
    ss(t) = SampleSet.fromDist(t)
    animalModule = {
      //Sentient Welfare
      average_qaly_per_year = ss(0.7 to 0.9)
      qalys_in_farming_per_year = ss(mx(-(0.2 to 100), 0.01 to 0.5, [0.7,0.3]))
      lifespan_in_farming = ss(0.3 to 0.6)
      cow_qalys_per_human = ss(0.1 to 0.6)
      human_params = ["qaly", "life"]
      animal_params = ["qaly", "life", "farmed_life", "farmed_animal_cal_100", "farmed_animal_lb_1"]
      
      animals = {
          human: {qaly: mx(1), lifespan: (ss(70 to 75))},
          cow: {qaly: cow_qalys_per_human, lifespan: (ss(17 to 20)), calories: 840720, poundsOfMeat: 440},
          pig: {qaly: cow_qalys_per_human * (0.5 to 1.5), lifespan: (ss(15 to 20)), calories: 37000, poundsOfMeat: 144},
          chicken: {qaly: cow_qalys_per_human * ss(0.1 to 0.4), lifespan: ss(3.5 to 4.5), calories: 1430, poundsOfMeat: 4.7},
          turkey: {qaly: cow_qalys_per_human * ss(0.1 to 0.5), lifespan: ss(8 to 10), calories: 7205, poundsOfMeat: 17 to 24},
          salmon: {qaly: cow_qalys_per_human * ss(0.01 to 0.3), lifespan: ss(1.5 to 2), calories: 309, poundsOfMeat: 2.3},
          shrimp: {qaly: cow_qalys_per_human * ss(0.001 to 0.05), lifespan: ss(1 to 2), calories: 7, poundsOfMeat: 1/25}
      }
    
      animal_saved_life_value(a) = a.qaly * a.lifespan * average_qaly_per_year
      farmed_animal_life(a) = a.qaly * a.lifespan * lifespan_in_farming * qalys_in_farming_per_year
      farmed_animal_cal_100(a) = 100 * a.qaly * a.lifespan * lifespan_in_farming * qalys_in_farming_per_year / a.calories
      farmed_animal_lb_1(a) = a.qaly * a.lifespan * lifespan_in_farming * qalys_in_farming_per_year / a.poundsOfMeat
    
      values = {
        qaly: {|a| a.qaly},
        life: {|a| a.life},
        lifespan: {|a| a.lifespan},
        life: animal_saved_life_value,
        farmed_life: farmed_animal_life,
        farmed_animal_lb_1: farmed_animal_lb_1,
        farmed_animal_cal_100: farmed_animal_cal_100
      }
      
      getValue(animal, param) = {
        values[param](animals[animal])
      }
    
      toDict(animals, props) = animals -> List.map( 
        {|animal|
           props -> List.map({|param| {animal: animal, p: param, fn:{|| getValue(animal, param)}}})
        }
      ) -> List.flatten -> List.map({|i| [i.animal + "_" + i.p, i.fn]}) -> Dict.fromList
      
      {getValue: getValue, asDict: Dict.merge(toDict(["human"], human_params),toDict(["cow", "chicken", "turkey", "salmon", "pig", "shrimp"], animal_params))}
    }
    
    qaly_to_utopia = ss(animalModule.getValue("human", "qaly") * (10E18 to 10E50))
    utopia_to_hell = ss(-(.01 to 10000))
    universal_to_local_utopia_or_hell = 0.0000001 to 0.5
    
    macrovariable_microtopia = qaly_to_utopia * (1/1M)
    macrovariable_microhell = utopia_to_hell * macrovariable_microtopia
    
    macrovariable_universal_microtopia = macrovariable_microtopia * (1/universal_to_local_utopia_or_hell)
    macrovariable_microdoom = -1 * macrovariable_microtopia * ss(0.1 to 0.6)
    
    macrovariable_universal_microhell = macrovariable_microhell * (1/universal_to_local_utopia_or_hell)
    
    
    
    dollars_for_OP_longtermism_to_save_one_deci_utopia = ss(100B to 10000T)
    dollars_for_OP_longtermism_to_save_one_microtopia = (dollars_for_OP_longtermism_to_save_one_deci_utopia / 100k) * (10 to 100) // convert to mTopia, then add factor for more efficient returns before one decaUtopia.
    longterm_discount_rate = ss(0.00001 to 0.8)
    
    longtermism_2020_to_2023 = ss(0.8 to 1.6)
    animals_2020_to_2023 = ss(0.7 to 1.15)
    
    ltff_to_openphil = ss(0.7 to 2.2)
    ea_to_longtermism = ss(0.1 to 3)
    
    //Key variables
    expected_positive_openphil_2020_impact = macrovariable_microtopia * longterm_discount_rate * 1/dollars_for_OP_longtermism_to_save_one_microtopia 
    potential_impact_if_negative =  ss(-1*(0.01 to 0.4))
    funder_openphil_2020 = mx(expected_positive_openphil_2020_impact, potential_impact_if_negative * expected_positive_openphil_2020_impact, [0.7, 0.3])
    funder_openphil_2023 = funder_openphil_2020 * longtermism_2020_to_2023
    
    funder_eafund_ltff_2020 = funder_openphil_2020 * ltff_to_openphil
    funder_eafund_ltff_2023 = funder_eafund_ltff_2020 * longtermism_2020_to_2023
    
    //Key variables
    animal_or_human_to_1_dollar_OP_for_longtermism = ss(1000 to 1M) // How many dollars would longtermists trade for the longtermist benefits of giving to animals/humans, effectively? My guess is that $1M to the EA Animal charities will give some kind of longtermist benefit or another - worth at least $1 to OP longtermism.
    
    saved_salmon_remaining_QALYS = 1 to 5
    funder_eafund_animal_welfare_2020 = animalModule.getValue("cow", "life") * (1 / (ss(10 to 1000))) + (1/animal_or_human_to_1_dollar_OP_for_longtermism) * funder_openphil_2020
    funder_eafund_animal_welfare_2023 = funder_eafund_animal_welfare_2020 * animals_2020_to_2023
    saved_human_remaining_QALYS = 30 to 80
    
    
    funder_eafund_globalhealth_2020_direct = animalModule.getValue("human", "life") * (1 / (5000 to 20000))
    funder_eafund_globalhealth_2020 = funder_eafund_globalhealth_2020_direct + (1/animal_or_human_to_1_dollar_OP_for_longtermism) * funder_openphil_2020
    
    funder_eafund_ea_infrastructure_2020 = (funder_eafund_ltff_2020 * ss(0.1 to 0.6)) + (funder_eafund_globalhealth_2020 * ss(0.01 to 0.5)) + (funder_eafund_animal_welfare_2020 * ss(0.01 to 0.5))
    funder_eafund_ea_infrastructure_2023 = funder_eafund_ea_infrastructure_2020 * ss(0.8 to 1.4)
    
    vars = {
        funder_openphil_2020: funder_openphil_2020,
        funder_openphil_2023: funder_openphil_2023,
        funder_eafund_ltff_2020: funder_eafund_ltff_2020,
        funder_eafund_ltff_2023: funder_eafund_ltff_2023,
        funder_eafund_animal_welfare_2020: funder_eafund_animal_welfare_2020,
        funder_eafund_animal_welfare_2023: funder_eafund_animal_welfare_2023,
        funder_eafund_ea_infrastructure_2020: funder_eafund_ea_infrastructure_2020,
        funder_eafund_ea_infrastructure_2023: funder_eafund_ea_infrastructure_2023,
        funder_eafund_globalhealth_2020: funder_eafund_globalhealth_2020,
        funder_eafund_globalhealth_2020_direct: funder_eafund_globalhealth_2020_direct,
        macrovariable_microdoom: macrovariable_microdoom,
        macrovariable_universal_microtopia: macrovariable_universal_microtopia,
        macrovariable_microtopia: macrovariable_microtopia,
        macrovariable_microhell: macrovariable_microhell,
        macrovariable_universal_microhell: macrovariable_universal_microhell
    } -> Dict.merge(animalModule.asDict -> Dict.mapKeys({|k| "sentientWelfare_" + k}) -> Dict.map({|r| r()}))
    
    fn(a,b) = [vars[a], vars[b]]
`,
  };
}

export const catalog = getCatalog();
export const models = [getTextModel()];
