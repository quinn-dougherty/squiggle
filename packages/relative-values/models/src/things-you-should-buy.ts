import { Model } from "@/model/utils";
import { Catalog, InterfaceWithModels, Item } from "@/types";
import { Map } from "immutable";

// Note: Much of this was generated by this file:
// https://observablehq.com/d/98cbe0073226a5f9

function getCatalog(): Catalog {
  const items: Item[] = [
    {
      id: "i0",
      name: "Nice computer",
      clusterId: "consumerism",
    },
    {
      id: "i1",
      name: "Nice headphones",
      clusterId: "consumerism",
    },
    {
      id: "i2",
      name: "Great sleep mask",
      clusterId: "consumerism",
    },
    {
      id: "i3",
      name: "Melatonin",
      clusterId: "consumerism",
    },
    {
      id: "i4",
      name: "Spare laptop charger",
      clusterId: "consumerism",
    },
    {
      id: "i5",
      name: "External battery",
      clusterId: "consumerism",
    },
    {
      id: "i6",
      name: "Zinc Lozenges",
      clusterId: "consumerism",
    },
    {
      id: "i7",
      name: "Vertical mouse",
      clusterId: "consumerism",
    },
    {
      id: "i8",
      name: "External microphone",
      clusterId: "consumerism",
    },

    {
      id: "i9",
      name: "Watch",
      clusterId: "consumerism",
    },
  ];

  return {
    id: "things-you-should-buy",
    title: "Things you should buy",
    items,
    clusters: {
      consumerism: {
        name: "Consumerism",
        color: "#DB828C",
      },
    },
  };
}

function getTextModel(): Model {
  return {
    id: "things-to-buy",
    title: "Estimates for a few things you may want to buy",
    author: "Nuno Sempere",
    mode: "text",
    code: `

// Utils
ss = {|dist| SampleSet.fromDist(dist) }
// note: SampleSet ensures that the correlation 
// is propagated, which allows for relative values.

// General factors
// The reader should edit these!
salary = ss(90k to 150k)
value_doubling_productivity = ss(30k to 75k)
// how much would you pay to be 100% more productive? 
// personally, i.e., from your own salary.
hours_worked_in_year = ss( (48 to 52) * (5 to 8 ))
hours_day_in_front_of_computer = ss(8 to 14)
hourly_salary = ss(salary / hours_worked_in_year)
value_additional_free_hour = 30 to 150 // dollars

/* https://forum.effectivealtruism.org/posts/fwtoEN5pZpDfQQLKz/stuff-i-buy-and-use-a-listicle-to-boost-your-consumer */

// Nice computer (e.g., MacBook Pro)
cost_nice_computer = 2k to 3k
fraction_improvement_productivity = beta(1.6308424891839157, 13.480636131095403)
// ^ 1% to 30% (https://nunosempere.com/blog/2023/03/15/fit-beta/)
value_from_productivity = fraction_improvement_productivity * value_doubling_productivity
value_from_subjective_wellbeing = 1k to 5k // very uncertain
years_of_use_nice_computer = 1 to 4

value_nice_computer = (value_from_productivity + value_from_subjective_wellbeing) * years_of_use_nice_computer
recommendation_nice_computer = mean(value_nice_computer) > mean(cost_nice_computer) ? true : false
item_nice_computer = {
	id: "1",
  num_id: 1,
	name: "Nice computer (e.g., MacBook pro) (lifetime of item)",
	cost: cost_nice_computer,
	value: value_nice_computer,
	recommendation: recommendation_nice_computer
}

// Good headphones
cost_nice_headphones = 250 to 350 // dollars
hours_per_day_with_headphones = hours_day_in_front_of_computer
hedonic_improvement_from_current_headphones = 1 to 2
// good headphones improve by moment-to-moment experience 
// a whole lot, i.e., listening to music moves me from a 
// 4 to a 6 in a 1-10 scale
hedonic_improvement_from_new_headphones = 1.5 to 2.2
// pulling this number out of my ass.
// in particular, old headphones (Senheiser) are good, but 
// bluetooth isn't particularly great
// and they are starting to have some problems
value_hedonic_improvement_in_dollars = 1 to 10
// value of a 1 point improvement in a 1-10 scale for 1h.
// initial thought is
// would pay $30/hour to go from a 5 to an 8? yeah
// or (24-9) * 365 * (8-5) * 10 = $164,250
// lol, I can't afford to pay $30/hour
// for a 3 point improvement in a 1-10 scale
// (if it was all year round)
// this sucks
// I'm still considering leaving the $10/1 point improvement
// one could also adjust for hedonic treadmill?
hedonic_delta_headphones = truncateLeft(hedonic_improvement_from_new_headphones - hedonic_improvement_from_current_headphones, 1)
// the calculation of the delta is obvious, 
// but whence the truncation?
// well, if you don't like the new ones, you can keep the old ones
// the truncation at 1 instead of at zero is so that relative values work.
// but we can also pretend that it's because there is some value of information
lifespan_headphones = ( 1 to 3 ) * 365 

value_nice_headphones = hedonic_delta_headphones * hours_per_day_with_headphones * lifespan_headphones * value_hedonic_improvement_in_dollars
recommendation_nice_headphones = mean(hedonic_delta_headphones) > mean(cost_nice_headphones) ? true : false
item_nice_headphones = {
	id: "2",
  num_id: 2,
	name: "Nice headphones (e.g., Bose 45) (lifespan of item)",
	cost: cost_nice_headphones,
	value: value_nice_headphones,
	recommendation: recommendation_nice_headphones
}

// Health stuff in above article: man, too difficult to estimate.
// https://s8mb.medium.com/stuff-that-i-recommend-you-buy-747d7a3bd51e
// https://scribe.rip/@s8mb/things-i-recommend-you-buy-and-use-second-edition-457a8e7163f6
// Man, this guy is a foodie with a permanent home
// so most of his recommendations don't apply to me

// Homini sleep mask
cost_hommini_sleep_mask = 15 // dollars
num_travel_per_year = 15
fraction_travel_in_which_sleep_mask_is_useful = beta(3.078888443018226, 5.224031849460337)
consumer_surplus_per_travel_in_which_it_is_useful = 5 to 50 // dollars
num_years_before_lost = 1 to 3
// mask lasts, but I could lose it before then

value_hommini_sleep_mask = num_travel_per_year * fraction_travel_in_which_sleep_mask_is_useful * consumer_surplus_per_travel_in_which_it_is_useful * num_years_before_lost
recommendation_hommini_sleep_mask = mean(value_hommini_sleep_mask) > cost_hommini_sleep_mask ? true : false

item_hommini_sleep_mask = {
  id: "3",
  num_id: 3,
	name: "Really good sleep mask (e.g., Hommini sleep mask) (lifetime of item)",
	cost: cost_hommini_sleep_mask,
	value: value_hommini_sleep_mask,
	recommendation: recommendation_hommini_sleep_mask
}

// <https://scribe.rip/@robertwiblin/things-i-recommend-you-buy-and-use-rob-edition-1d7b2ce27d68>

// Melatonin
cost_melatonin_per_day = 0.2 + 1 
// most of the cost is going to come from the hassle of remembering to order & take it
// not from the actual cost
// also, price has gone up a bit since the post, from 0.02/day => 0.2/day
// (per <https://www.amazon.com.mx/Natrol-Melatonina-Gomita-Mg-unidades/dp/B07JYQMKSN>,
// note that price there is in pesos ) 
gained_time_per_day = (10 to 30) / 60 // article says 15 to 30 mins, but human variability is high
value_melatonin_per_day = value_additional_free_hour * gained_time_per_day
time_until_lapsing = to(30, 365 * 2) // time until you somehow stop taking this.

value_melatonin = value_melatonin_per_day * time_until_lapsing
recommendation_melatonin = mean(value_melatonin_per_day) > cost_melatonin_per_day ? true : false
item_melatonin = {
  id: "4",
  num_id: 4,
	name: "Melatonin (until dropping intervention)",
	cost: cost_melatonin_per_day * time_until_lapsing,
	value: value_melatonin,
	recommendation: recommendation_melatonin
}

// Spare laptop charger
cost_spare_laptop_charger = 15 to 40 // dollars
chance_of_default_charger_breakage_per_year = beta(1.2615450872566734, 5.967171456277175)
// ^ 1% to 50%
hours_needed_to_replace_it = 0.5 to 2
value_of_avoiding_hassle_if_broken = 100 // dollars
years_until_replacement_lost = 1 to 3

value_spare_laptop_charger = chance_of_default_charger_breakage_per_year * hours_needed_to_replace_it * value_of_avoiding_hassle_if_broken * years_until_replacement_lost
recommendation_spare_laptop_charger = mean(value_spare_laptop_charger) > mean(cost_spare_laptop_charger) ? true : false
item_spare_laptop_charger = {
	id: "5",
  num_id: 5,
	name: "Spare laptop charger (lifetime of item)",
	cost: cost_spare_laptop_charger,
	value: value_spare_laptop_charger,
	recommendation: recommendation_spare_laptop_charger
}

// External portable battery
cost_external_battery = 10 to 30 // dollars
chance_phone_emergency_per_year = beta(3.419089535996063, 2.5519151847850527)
// ^ 20% to 90%
// surprisingly large in my case
cost_phone_emergency = 5 to 200 // dollars 
years_until_portable_battery_lost = 1 to 3

value_external_portable_battery = chance_phone_emergency_per_year * cost_phone_emergency * years_until_portable_battery_lost
recommendation_external_portable_battery = mean(value_external_portable_battery) > mean(cost_external_battery) ? true : false
item_external_portable_battery = {
	id: "6",
  num_id: 6,
	name: "External battery (for mobile) (lifetime of item)",
	cost: cost_external_battery,
	value: value_external_portable_battery,
	recommendation: recommendation_external_portable_battery
}

// Zinc lozenges
cost_zinc_lozenges = 10 to 100 
// actually surprisingly hard to keep track of buying them
// and finding the correct lozenges
num_times_sick_in_a_year = 1 to 10
chance_zinc_lozenges_have_any_effect = beta(4.537349563353576, 4.537346351612813)
// 20% to 80%
effect_size_if_any = 0.5 to 2 // reductions in days of sickness

value_zinc_lozenges = num_times_sick_in_a_year *chance_zinc_lozenges_have_any_effect * effect_size_if_any * value_additional_free_hour
recommendation_zinc_lozenges = mean(value_zinc_lozenges) > mean(cost_zinc_lozenges) ? true : false
item_zinc_lozenges = {
	id: "7",
  num_id: 7,
	name: "Zinc lozenges (yearly)",
	cost: cost_zinc_lozenges,
	value: value_zinc_lozenges,
	recommendation: recommendation_zinc_lozenges
}

// Vertical mouse
cost_vertical_mouse = 18 // dollars
baseline_chance_rsi = beta(1.6308424891839157, 13.480636131095403)
// 1% to 30%
probability_avoiding_rsi = (0.1 to 2)/100
// 0.1% to 2%
// conditional on otherwise having acquired it
productivity_hit_from_rsi = beta(2.7271185998368788, 9.00518632631021)
// 5% to 50%
duration_rsi = 0.5 to 10 // years
chance_any_salary_drop = beta(2.7271185998368788, 9.00518632631021)
// 5% to 50%
reduction_in_salary_due_to_productivity_drop_as_fraction_of_total_salary = beta(6.016238977583864, 7.597431061918561)

value_vertical_mouse = baseline_chance_rsi * probability_avoiding_rsi * duration_rsi * (productivity_hit_from_rsi * value_doubling_productivity + chance_any_salary_drop * reduction_in_salary_due_to_productivity_drop_as_fraction_of_total_salary)
recommendation_vertical_mouse = mean(value_vertical_mouse) > cost_vertical_mouse ? true : false
item_vertical_mouse = {
	id: "8",
  num_id: 8,
	name: "Vertical mouse (e.g., from Anker)",
	cost: cost_vertical_mouse,
	value: value_vertical_mouse,
	recommendation: recommendation_vertical_mouse
}

// External microphone
cost_external_microphone = 100 to 500
improvement_in_calls = 0.05 to 2
// 5% to 200%
value_of_better_call = 3 to 12 // dollars 
// how much would you pay to have "better calls",
// arbitrarily defined
num_calls_per_year = 52 to 100
// 52 = once a week

value_external_microphone = improvement_in_calls *value_of_better_call *num_calls_per_year
recommendation_external_microphone = mean(value_external_microphone) > mean(cost_external_microphone) ? true : false
item_external_microphone = {
	id: "9",
  num_id: 9,
	name: "External microphone (value for 1 year)",
	cost: cost_external_microphone,
	value: value_external_microphone,
	recommendation: recommendation_external_microphone
}

// Watch
cost_casio_watch = 15 to 50
num_check_time_day = 1 to 20
would_otherwise_check_phone = beta(1.5598524392792164, 0.36044253926611014)
// 20% to 100% of the time
would_otherwise_get_distracted_by_phone = beta(5.224031849460337, 3.078888443018226)
// 30% to 90%
duration_distraction_seconds = 15 to 60
value_not_getting_distracted_by_phone = value_additional_free_hour * duration_distraction_seconds / 3600
// ^ one could also input the value of no distractions directly: 0.2 to 2 // 20cts to 2 dollars
coolness_factor = 50 to 200 
value_casio_watch = 365 * (num_check_time_day * would_otherwise_check_phone * would_otherwise_get_distracted_by_phone * value_not_getting_distracted_by_phone) + coolness_factor
recommendation_casio_watch = mean(value_casio_watch) > mean(cost_casio_watch) ? true : false

item_casio_watch = {
	id: "10",
  num_id: 10,
	name: "Watch (e.g., Casio F-91W)",
	cost: cost_casio_watch,
	value: value_casio_watch,
	recommendation: recommendation_casio_watch
}

 /* Put all items in a list */

items = [
  item_nice_computer, item_nice_headphones, item_hommini_sleep_mask, item_melatonin, item_spare_laptop_charger, item_external_portable_battery, item_zinc_lozenges, item_vertical_mouse, item_external_microphone, item_casio_watch
]

 // Glue code for https://relative-values-git-relative-values-quantified-uncertainty.vercel.app/interfaces/cross-cause/models/Cross-Cause-Estimate

items_object = {
	"i0": item_nice_computer,
	"i1": item_nice_headphones,
	"i2": item_hommini_sleep_mask,
	"i3": item_melatonin,
	"i4": item_spare_laptop_charger,
	"i5": item_external_portable_battery,
	"i6": item_zinc_lozenges,
	"i7": item_vertical_mouse,
	"i8": item_external_microphone,
	"i9": item_casio_watch
}

getRelativeValues = {|item_1, item_2|
  if item_1.id == item_2.id then [item_1.value, item_1.value] else  [item_1.value, item_2.value]
}

fn(a,b) = getRelativeValues(items_object[a], items_object[b])
// fn("i5", "i4")
//item_nice_headphones`,
  };
}

export const catalog = getCatalog();
export const models = [getTextModel()];
