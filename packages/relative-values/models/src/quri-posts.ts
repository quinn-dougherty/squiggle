import { Model } from "@/model/utils";
import { Catalog, InterfaceWithModels, Item } from "@/types";
import { Map } from "immutable";

// Note: Much of this was generated by this file:
// https://observablehq.com/d/98cbe0073226a5f9

function getCatalog(): Catalog {
  const items: Item[] = [
    {
      id: "paper-0",
      name: "Creating a Text Shorthand for Uncertainty",
      clusterId: "papers",
    },
    {
      id: "paper-1",
      name: "Graphical Assumption Modeling",
      clusterId: "papers",
    },
    {
      id: "paper-2",
      name: "Prediction-Augmented Evaluation Systems",
      clusterId: "papers",
    },
    {
      id: "paper-3",
      name: "What if people simply forecasted your future choices?",
      clusterId: "papers",
    },
    { id: "paper-4", name: "Stabilize-Reflect-Execute", clusterId: "papers" },
    {
      id: "paper-5",
      name: "Overconfident talking down, humble or hostile talking up",
      clusterId: "papers",
    },
    {
      id: "paper-6",
      name: "Three Kinds of Research Documents: Exploration, Explanation, Academic",
      clusterId: "papers",
    },
    {
      id: "paper-7",
      name: "The RAIN Framework for Informational Effectiveness",
      clusterId: "papers",
    },
    {
      id: "paper-8",
      name: "The Prediction Pyramid: Why Fundamental Work is Needed for Prediction Work",
      clusterId: "papers",
    },
    {
      id: "paper-9",
      name: "Can We Place Trust in Post-AGI Forecasting Evaluations?",
      clusterId: "papers",
    },
    {
      id: "paper-10",
      name: "Predictive Reasoning Systems",
      clusterId: "papers",
    },
    {
      id: "paper-11",
      name: "Impact Prizes as an alternative to Certificates of Impact",
      clusterId: "papers",
    },
    {
      id: "paper-12",
      name: "Conversation on forecasting with Vaniver and Ozzie Gooen",
      clusterId: "papers",
    },
    {
      id: "paper-13",
      name: "Shallow Review of Consistency in Statement Evaluation",
      clusterId: "papers",
    },
    {
      id: "paper-14",
      name: "Introducing http://foretold.io/: A New Open-Source Prediction Registry",
      clusterId: "papers",
    },
    {
      id: "paper-15",
      name: "Amplifying generalist research via forecasting – results from a preliminary exploration Part 2",
      clusterId: "papers",
    },
    {
      id: "paper-16",
      name: "Amplifying generalist research via forecasting – results from a preliminary exploration Part 1",
      clusterId: "papers",
    },
    {
      id: "paper-17",
      name: "Predictably Predictable Futures Talk:\nUsing Expected Loss & Prediction Innovation for Long Term Benefits",
      clusterId: "papers",
    },
    {
      id: "paper-18",
      name: "Multivariate estimation & the Squiggly language",
      clusterId: "papers",
    },
    {
      id: "paper-19",
      name: "Expansive translations: considerations and possibilities",
      clusterId: "papers",
    },
    {
      id: "paper-20",
      name: "Open Communication in the Days of Malicious Online Actors",
      clusterId: "papers",
    },
    {
      id: "paper-21",
      name: "Can we hold intellectuals to similar public standards as athletes?",
      clusterId: "papers",
    },
    {
      id: "paper-22",
      name: "Adjusting probabilities for the passage of time, using Squiggle",
      clusterId: "papers",
    },
    {
      id: "paper-23",
      name: "Incentive Problems With Current Forecasting Competitions.",
      clusterId: "papers",
    },
    {
      id: "paper-24",
      name: "Are the social sciences challenging because of fundamental difficulties or because of imposed ones?",
      clusterId: "papers",
    },
    {
      id: "paper-25",
      name: "Announcing the Forecasting Innovation Prize",
      clusterId: "papers",
    },
    {
      id: "paper-26",
      name: "Predicting the Value of Small Altruistic Projects: A Proof of Concept Experiment.",
      clusterId: "papers",
    },
    { id: "paper-27", name: "Squiggle: An overview", clusterId: "papers" },
    {
      id: "paper-28",
      name: "Squiggle: Technical Overview",
      clusterId: "papers",
    },
    {
      id: "paper-29",
      name: "Prize: Interesting Examples of Evaluations",
      clusterId: "papers",
    },
    {
      id: "paper-30",
      name: "An experiment to evaluate the value of one researcher's work",
      clusterId: "papers",
    },
    {
      id: "paper-31",
      name: "Real-Life Examples of Prediction Systems Interfering with the Real World (Predict-O-Matic Problems)",
      clusterId: "papers",
    },
    {
      id: "paper-32",
      name: "Big List of Cause Candidates",
      clusterId: "papers",
    },
    {
      id: "paper-33",
      name: "Evaluations Blog Post: Quantifying the Value of Evaluations",
      clusterId: "papers",
    },
    {
      id: "paper-34",
      name: "2020: Forecasting in Review",
      clusterId: "papers",
    },
    {
      id: "paper-35",
      name: "A Funnel for Cause Candidates",
      clusterId: "papers",
    },
    { id: "paper-36", name: "Forecasting Prize Results", clusterId: "papers" },
    {
      id: "paper-37",
      name: "Introducing Metaforecasting: A Forecast Aggregator and Search Tool",
      clusterId: "papers",
    },
    {
      id: "paper-38",
      name: "Relative Impact of the First 10 EA Forum Prize Winners",
      clusterId: "papers",
    },
    {
      id: "paper-39",
      name: "Questions are tools to help answerers optimize utility",
      clusterId: "papers",
    },
    {
      id: "paper-40",
      name: "Oracles, Informers, and Controllers",
      clusterId: "papers",
    },
    {
      id: "paper-41",
      name: "The Practice & Virtue of Discernment",
      clusterId: "papers",
    },
    {
      id: "paper-42",
      name: "Two Definitions of Generalization",
      clusterId: "papers",
    },
    {
      id: "paper-43",
      name: "2018-2019 Long Term Future Fund Grantees: How did they do?",
      clusterId: "papers",
    },
    {
      id: "paper-44",
      name: "What should the norms around privacy and evaluation in the EA community be?",
      clusterId: "papers",
    },
    {
      id: "paper-45",
      name: "Shallow evaluations of longtermist organizations",
      clusterId: "papers",
    },
    {
      id: "paper-46",
      name: "Contribution-Adjusted Utility Maximization Funds: An Early Proposal",
      clusterId: "papers",
    },
    {
      id: "paper-47",
      name: "AI Safety Papers: An App for the TAI Safety Database",
      clusterId: "papers",
    },
    { id: "paper-48", name: "Information Assets", clusterId: "papers" },
    {
      id: "paper-49",
      name: "Building Blocks of Utility Maximization",
      clusterId: "papers",
    },
    {
      id: "paper-50",
      name: "Prioritization Research for Advancing Wisdom and Intelligence",
      clusterId: "papers",
    },
    {
      id: "paper-51",
      name: "An estimate of the value of Metaculus questions",
      clusterId: "papers",
    },
    {
      id: "paper-52",
      name: "Disagreeables and Assessors: Two Intellectual Archetypes",
      clusterId: "papers",
    },
    {
      id: "paper-53",
      name: "Improve delegation abilities today, delegate heavily tomorrow",
      clusterId: "papers",
    },
    {
      id: "paper-54",
      name: "Simple comparison polling to create utility functions",
      clusterId: "papers",
    },
    {
      id: "paper-55",
      name: "Ambitious Altruistic Software Engineering Efforts: Opportunities and Benefits",
      clusterId: "papers",
    },
    {
      id: "paper-56",
      name: "Opportunity Costs of Technical Talent: Intuition and (Simple) Implications",
      clusterId: "papers",
    },
    {
      id: "paper-57",
      name: "Flimsy Pet Theories, Enormous Initiatives",
      clusterId: "papers",
    },
    {
      id: "paper-58",
      name: "External Evaluation of the EA Wiki",
      clusterId: "papers",
    },
    {
      id: "paper-59",
      name: "Why don't governments seem to mind that companies are explicitly trying to make AGIs?",
      clusterId: "papers",
    },
    {
      id: "paper-60",
      name: "Can/should we automate most human decisions, pre-AGI?",
      clusterId: "papers",
    },
    {
      id: "paper-61",
      name: "13 Very Different Stances on AGI",
      clusterId: "papers",
    },
    {
      id: "paper-62",
      name: "EA/Rationalist Safety Nets: Promising, but Arduous",
      clusterId: "papers",
    },
    {
      id: "paper-63",
      name: "Forecasting Newsletter: Looking back at 2021.",
      clusterId: "papers",
    },
    {
      id: "paper-64",
      name: "Splitting the timeline as an extinction risk intervention",
      clusterId: "papers",
    },
    {
      id: "paper-65",
      name: "Five steps for quantifying speculative interventions",
      clusterId: "papers",
    },
    {
      id: "paper-66",
      name: "Valuing research works by eliciting comparisons from EA researchers",
      clusterId: "papers",
    },
    {
      id: "paper-67",
      name: "Big List of Cause Candidates: January 2021–March 2022 update",
      clusterId: "papers",
    },
    {
      id: "paper-68",
      name: "Quantifying Uncertainty in GiveWell's GiveDirectly Cost-Effectiveness Analysis",
      clusterId: "papers",
    },
    {
      id: "paper-69",
      name: "A Critical Review of Open Philanthropy’s Bet On Criminal Justice Reform",
      clusterId: "papers",
    },
    {
      id: "paper-70",
      name: "Announcing Squiggle: Early Access",
      clusterId: "papers",
    },
    {
      id: "paper-71",
      name: "$1,000 Squiggle Experimentation Challenge",
      clusterId: "papers",
    },
    {
      id: "paper-72",
      name: "Introduction to Fermi estimates",
      clusterId: "papers",
    },
    {
      id: "paper-73",
      name: "Value of Infomation, an example with GiveDirectly",
      clusterId: "papers",
    },
    {
      id: "paper-74",
      name: "Simple estimation examples in Squiggle",
      clusterId: "papers",
    },
    {
      id: "paper-75",
      name: "An experiment eliciting relative estimates for Open Philanthropy’s 2018 AI safety grants",
      clusterId: "papers",
    },
    {
      id: "paper-76",
      name: "$5k challenge to quantify the impact of 80,000 hours' top career paths",
      clusterId: "papers",
    },
    {
      id: "paper-77",
      name: "Five slightly more hardcore Squiggle models.",
      clusterId: "papers",
    },
    {
      id: "paper-78",
      name: "Brief evaluations of top-10 billionnaires",
      clusterId: "papers",
    },
    {
      id: "paper-79",
      name: "Quantifying Uncertainty in GiveWell CEAs",
      clusterId: "papers",
    },
    {
      id: "paper-80",
      name: "Metaforecast late 2022 update: GraphQL API, Charts, better infrastructure behind the scenes.",
      clusterId: "papers",
    },
    {
      id: "paper-81",
      name: "Tracking the money flows in forecasting",
      clusterId: "papers",
    },
    {
      id: "paper-82",
      name: "List of past fraudsters similar to SBF",
      clusterId: "papers",
    },
    {
      id: "paper-83",
      name: "Misha Yagudin and Ozzie Gooen Discuss LLMs and Effective Altruism",
      clusterId: "papers",
    },
    {
      id: "paper-84",
      name: "Why does Academia+EA produce so few online videos?",
      clusterId: "papers",
    },
    {
      id: "paper-85",
      name: "EA could use better internal communications infrastructure",
      clusterId: "papers",
    },
    {
      id: "paper-86",
      name: "Can GPT-3 produce new ideas? Partially automating Robin Hanson and others",
      clusterId: "papers",
    },
    {
      id: "paper-87",
      name: "My highly personal skepticism braindump on existential risk from artificial intelligence.",
      clusterId: "papers",
    },
    {
      id: "paper-88",
      name: "An in-progress experiment to test how Laplace’s rule of succession performs in practice.",
      clusterId: "papers",
    },
    {
      id: "paper-89",
      name: "Eli Lifland on Navigating the AI Alignment Landscape",
      clusterId: "papers",
    },
    {
      id: "paper-90",
      name: "Straightforwardly eliciting probabilities from GPT-3",
      clusterId: "papers",
    },
    {
      id: "paper-91",
      name: "Select Challenges with Criticism & Evaluation Around EA",
      clusterId: "papers",
    },
    {
      id: "paper-92",
      name: "Who is Uncomfortable Critiquing Who, Around EA?",
      clusterId: "papers",
    },
    {
      id: "paper-93",
      name: "Winners of the Squiggle Experimentation and 80,000 Hours Quantification Challenges",
      clusterId: "papers",
    },
  ];

  return {
    id: "quri-papers",
    title: "QURI papers",
    items,
    clusters: {
      papers: {
        name: "Papers",
        color: "#DB828C",
      },
    },
  };
}

function getTextModel(): Model {
  return {
    id: "quick-ozzie-estimate",
    title: "QURI Papers Estimate, Quick",
    author: "Ozzie Gooen",
    mode: "text",
    code: `
data = {"paper-0":{"id":"paper-0","name":"Creating a Text Shorthand for Uncertainty","importance":1,"author":"Ozzie Gooen","karma":9,"commentCount":29},"paper-1":{"id":"paper-1","name":"Graphical Assumption Modeling","importance":2,"author":"Ozzie Gooen","karma":32,"commentCount":23},"paper-2":{"id":"paper-2","name":"Prediction-Augmented Evaluation Systems","importance":3,"author":"Ozzie Gooen","karma":44,"commentCount":12},"paper-3":{"id":"paper-3","name":"What if people simply forecasted your future choices?","importance":1,"author":"Ozzie Gooen","karma":16,"commentCount":6},"paper-4":{"id":"paper-4","name":"Stabilize-Reflect-Execute","importance":1,"author":"Ozzie Gooen","karma":29,"commentCount":1},"paper-5":{"id":"paper-5","name":"Overconfident talking down, humble or hostile talking up","importance":2,"author":"Ozzie Gooen","karma":49,"commentCount":19},"paper-6":{"id":"paper-6","name":"Three Kinds of Research Documents: Exploration, Explanation, Academic","importance":1,"author":"Ozzie Gooen","karma":22,"commentCount":18},"paper-7":{"id":"paper-7","name":"The RAIN Framework for Informational Effectiveness","importance":1,"author":"Ozzie Gooen","karma":35,"commentCount":16},"paper-8":{"id":"paper-8","name":"The Prediction Pyramid: Why Fundamental Work is Needed for Prediction Work","importance":2,"author":"Ozzie Gooen","karma":43,"commentCount":15},"paper-9":{"id":"paper-9","name":"Can We Place Trust in Post-AGI Forecasting Evaluations?","importance":1,"author":"Ozzie Gooen","karma":22,"commentCount":16},"paper-10":{"id":"paper-10","name":"Predictive Reasoning Systems","importance":2,"author":"Ozzie Gooen","karma":26,"commentCount":2},"paper-11":{"id":"paper-11","name":"Impact Prizes as an alternative to Certificates of Impact","importance":2,"author":"Ozzie Gooen","karma":39,"commentCount":17},"paper-12":{"id":"paper-12","name":"Conversation on forecasting with Vaniver and Ozzie Gooen","importance":3,"author":"Jacob Lagerros,Ozzie Gooen","karma":38,"commentCount":4},"paper-13":{"id":"paper-13","name":"Shallow Review of Consistency in Statement Evaluation","importance":2,"author":"Elizabeth Van Nostrand","karma":65,"commentCount":6},"paper-14":{"id":"paper-14","name":"Introducing http://foretold.io/: A New Open-Source Prediction Registry","importance":4,"author":"Ozzie Gooen","karma":48,"commentCount":5},"paper-15":{"id":"paper-15","name":"Amplifying generalist research via forecasting – results from a preliminary exploration Part 2","importance":3,"author":"Elizabeth Van Nostrand,Jacob Lagerros,Nuño Sempere,Ozzie Gooen","karma":32,"commentCount":1},"paper-16":{"id":"paper-16","name":"Amplifying generalist research via forecasting – results from a preliminary exploration Part 1","importance":3,"author":"Elizabeth Van Nostrand,Jacob Lagerros,Nuño Sempere,Ozzie Gooen","karma":60,"commentCount":2},"paper-17":{"id":"paper-17","name":"Predictably Predictable Futures Talk:\nUsing Expected Loss & Prediction Innovation for Long Term Benefits","importance":2,"author":"Ozzie Gooen","karma":10,"commentCount":0},"paper-18":{"id":"paper-18","name":"Multivariate estimation & the Squiggly language","importance":4,"author":"Ozzie Gooen","karma":44,"commentCount":5},"paper-19":{"id":"paper-19","name":"Expansive translations: considerations and possibilities","importance":1,"author":"Ozzie Gooen","karma":12,"commentCount":3},"paper-20":{"id":"paper-20","name":"Open Communication in the Days of Malicious Online Actors","importance":1,"author":"Ozzie Gooen","karma":38,"commentCount":10},"paper-21":{"id":"paper-21","name":"Can we hold intellectuals to similar public standards as athletes?","importance":1,"author":"Ozzie Gooen","karma":84,"commentCount":48},"paper-22":{"id":"paper-22","name":"Adjusting probabilities for the passage of time, using Squiggle","importance":1,"author":"Nuño Sempere","karma":17,"commentCount":2},"paper-23":{"id":"paper-23","name":"Incentive Problems With Current Forecasting Competitions.","importance":2,"author":"Nuño Sempere","karma":44,"commentCount":23},"paper-24":{"id":"paper-24","name":"Are the social sciences challenging because of fundamental difficulties or because of imposed ones?","importance":2,"author":"Ozzie Gooen","karma":56,"commentCount":13},"paper-25":{"id":"paper-25","name":"Announcing the Forecasting Innovation Prize","importance":2,"author":"Nuño Sempere,Ozzie Gooen","karma":68,"commentCount":5},"paper-26":{"id":"paper-26","name":"Predicting the Value of Small Altruistic Projects: A Proof of Concept Experiment.","importance":2,"author":"Nuño Sempere","karma":62,"commentCount":3},"paper-27":{"id":"paper-27","name":"Squiggle: An overview","importance":2,"author":"Ozzie Gooen","karma":59,"commentCount":6},"paper-28":{"id":"paper-28","name":"Squiggle: Technical Overview","importance":2,"author":"Ozzie Gooen","karma":18,"commentCount":3},"paper-29":{"id":"paper-29","name":"Prize: Interesting Examples of Evaluations","importance":1,"author":"Elizabeth Van Nostrand,Ozzie Gooen","karma":43,"commentCount":25},"paper-30":{"id":"paper-30","name":"An experiment to evaluate the value of one researcher's work","importance":2,"author":"Nuño Sempere","karma":57,"commentCount":23},"paper-31":{"id":"paper-31","name":"Real-Life Examples of Prediction Systems Interfering with the Real World (Predict-O-Matic Problems)","importance":2,"author":"Nuño Sempere","karma":122,"commentCount":29},"paper-32":{"id":"paper-32","name":"Big List of Cause Candidates","importance":3,"author":"Nuño Sempere","karma":239,"commentCount":69},"paper-33":{"id":"paper-33","name":"Evaluations Blog Post: Quantifying the Value of Evaluations","importance":1,"author":"Elizabeth Van Nostrand","karma":23,"commentCount":3},"paper-34":{"id":"paper-34","name":"2020: Forecasting in Review","importance":1,"author":"Nuño Sempere","karma":35,"commentCount":6},"paper-35":{"id":"paper-35","name":"A Funnel for Cause Candidates","importance":1,"author":"Nuño Sempere","karma":34,"commentCount":24},"paper-36":{"id":"paper-36","name":"Forecasting Prize Results","importance":2,"author":"Ozzie Gooen,Nuño Sempere","karma":44,"commentCount":4},"paper-37":{"id":"paper-37","name":"Introducing Metaforecasting: A Forecast Aggregator and Search Tool","importance":3,"author":"Nuño Sempere,Ozzie Gooen","karma":132,"commentCount":17},"paper-38":{"id":"paper-38","name":"Relative Impact of the First 10 EA Forum Prize Winners","importance":2,"author":"Nuño Sempere","karma":81,"commentCount":35},"paper-39":{"id":"paper-39","name":"Questions are tools to help answerers optimize utility","importance":1,"author":"Ozzie Gooen","karma":31,"commentCount":6},"paper-40":{"id":"paper-40","name":"Oracles, Informers, and Controllers","importance":2,"author":"Ozzie Gooen","karma":15,"commentCount":2},"paper-41":{"id":"paper-41","name":"The Practice & Virtue of Discernment","importance":2,"author":"Ozzie Gooen","karma":41,"commentCount":11},"paper-42":{"id":"paper-42","name":"Two Definitions of Generalization","importance":1,"author":"Ozzie Gooen","karma":33,"commentCount":4},"paper-43":{"id":"paper-43","name":"2018-2019 Long Term Future Fund Grantees: How did they do?","importance":3,"author":"Nuño Sempere","karma":197,"commentCount":23},"paper-44":{"id":"paper-44","name":"What should the norms around privacy and evaluation in the EA community be?","importance":1,"author":"Nuño Sempere","karma":65,"commentCount":17},"paper-45":{"id":"paper-45","name":"Shallow evaluations of longtermist organizations","importance":4,"author":"Nuño Sempere","karma":191,"commentCount":34},"paper-46":{"id":"paper-46","name":"Contribution-Adjusted Utility Maximization Funds: An Early Proposal","importance":2,"author":"Ozzie Gooen","karma":14,"commentCount":4},"paper-47":{"id":"paper-47","name":"AI Safety Papers: An App for the TAI Safety Database","importance":2,"author":"Ozzie Gooen","karma":75,"commentCount":13},"paper-48":{"id":"paper-48","name":"Information Assets","importance":2,"author":"Ozzie Gooen","karma":42,"commentCount":3},"paper-49":{"id":"paper-49","name":"Building Blocks of Utility Maximization","importance":1,"author":"Nuño Sempere","karma":21,"commentCount":3},"paper-50":{"id":"paper-50","name":"Prioritization Research for Advancing Wisdom and Intelligence","importance":4,"author":"Ozzie Gooen","karma":87,"commentCount":34},"paper-51":{"id":"paper-51","name":"An estimate of the value of Metaculus questions","importance":2,"author":"Nuño Sempere","karma":47,"commentCount":19},"paper-52":{"id":"paper-52","name":"Disagreeables and Assessors: Two Intellectual Archetypes","importance":2,"author":"Ozzie Gooen","karma":85,"commentCount":20},"paper-53":{"id":"paper-53","name":"Improve delegation abilities today, delegate heavily tomorrow","importance":2,"author":"Ozzie Gooen","karma":57,"commentCount":11},"paper-54":{"id":"paper-54","name":"Simple comparison polling to create utility functions","importance":3,"author":"Nuño Sempere","karma":45,"commentCount":13},"paper-55":{"id":"paper-55","name":"Ambitious Altruistic Software Engineering Efforts: Opportunities and Benefits","importance":2,"author":"Ozzie Gooen","karma":108,"commentCount":31},"paper-56":{"id":"paper-56","name":"Opportunity Costs of Technical Talent: Intuition and (Simple) Implications","importance":2,"author":"Ozzie Gooen","karma":46,"commentCount":7},"paper-57":{"id":"paper-57","name":"Flimsy Pet Theories, Enormous Initiatives","importance":3,"author":"Ozzie Gooen","karma":208,"commentCount":57},"paper-58":{"id":"paper-58","name":"External Evaluation of the EA Wiki","importance":3,"author":"Nuño Sempere","karma":77,"commentCount":18},"paper-59":{"id":"paper-59","name":"Why don't governments seem to mind that companies are explicitly trying to make AGIs?","importance":1,"author":"Ozzie Gooen","karma":82,"commentCount":52},"paper-60":{"id":"paper-60","name":"Can/should we automate most human decisions, pre-AGI?","importance":2,"author":"Ozzie Gooen","karma":25,"commentCount":9},"paper-61":{"id":"paper-61","name":"13 Very Different Stances on AGI","importance":1,"author":"Ozzie Gooen","karma":84,"commentCount":27},"paper-62":{"id":"paper-62","name":"EA/Rationalist Safety Nets: Promising, but Arduous","importance":1,"author":"Ozzie Gooen","karma":69,"commentCount":36},"paper-63":{"id":"paper-63","name":"Forecasting Newsletter: Looking back at 2021.","importance":2,"author":"Nuño Sempere","karma":60,"commentCount":8},"paper-64":{"id":"paper-64","name":"Splitting the timeline as an extinction risk intervention","importance":1,"author":"Nuño Sempere","karma":14,"commentCount":27},"paper-65":{"id":"paper-65","name":"Five steps for quantifying speculative interventions","importance":3,"author":"Nuño Sempere","karma":91,"commentCount":8},"paper-66":{"id":"paper-66","name":"Valuing research works by eliciting comparisons from EA researchers","importance":4,"author":"Nuño Sempere","karma":109,"commentCount":20},"paper-67":{"id":"paper-67","name":"Big List of Cause Candidates: January 2021–March 2022 update","importance":2,"author":"Nuño Sempere","karma":122,"commentCount":16},"paper-68":{"id":"paper-68","name":"Quantifying Uncertainty in GiveWell's GiveDirectly Cost-Effectiveness Analysis","importance":2,"author":"Sam Nolan","karma":130,"commentCount":19},"paper-69":{"id":"paper-69","name":"A Critical Review of Open Philanthropy’s Bet On Criminal Justice Reform","importance":3,"author":"Nuño Sempere","karma":298,"commentCount":100},"paper-70":{"id":"paper-70","name":"Announcing Squiggle: Early Access","importance":5,"author":"Ozzie Gooen","karma":147,"commentCount":11},"paper-71":{"id":"paper-71","name":"$1,000 Squiggle Experimentation Challenge","importance":2,"author":"Ozzie Gooen,Nuño Sempere","karma":61,"commentCount":5},"paper-72":{"id":"paper-72","name":"Introduction to Fermi estimates","importance":1,"author":"Nuño Sempere","karma":46,"commentCount":7},"paper-73":{"id":"paper-73","name":"Value of Infomation, an example with GiveDirectly","importance":1,"author":"Sam Nolan","karma":12,"commentCount":1},"paper-74":{"id":"paper-74","name":"Simple estimation examples in Squiggle","importance":1,"author":"Nuño Sempere","karma":52,"commentCount":13},"paper-75":{"id":"paper-75","name":"An experiment eliciting relative estimates for Open Philanthropy’s 2018 AI safety grants","importance":4,"author":"Nuño Sempere","karma":111,"commentCount":13},"paper-76":{"id":"paper-76","name":"$5k challenge to quantify the impact of 80,000 hours' top career paths","importance":2,"author":"Nuño Sempere","karma":126,"commentCount":14},"paper-77":{"id":"paper-77","name":"Five slightly more hardcore Squiggle models.","importance":1,"author":"Nuño Sempere","karma":30,"commentCount":0},"paper-78":{"id":"paper-78","name":"Brief evaluations of top-10 billionnaires","importance":1,"author":"Nuño Sempere","karma":79,"commentCount":66},"paper-79":{"id":"paper-79","name":"Quantifying Uncertainty in GiveWell CEAs","importance":3,"author":"Sam Nolan","karma":108,"commentCount":2},"paper-80":{"id":"paper-80","name":"Metaforecast late 2022 update: GraphQL API, Charts, better infrastructure behind the scenes.","importance":2,"author":"Nuño Sempere,Slava Matyuhin","karma":39,"commentCount":0},"paper-81":{"id":"paper-81","name":"Tracking the money flows in forecasting","importance":2,"author":"Nuño Sempere","karma":75,"commentCount":4},"paper-82":{"id":"paper-82","name":"List of past fraudsters similar to SBF","importance":2,"author":"Nuño Sempere","karma":114,"commentCount":11},"paper-83":{"id":"paper-83","name":"Misha Yagudin and Ozzie Gooen Discuss LLMs and Effective Altruism","importance":2,"author":"Ozzie Gooen","karma":45,"commentCount":3},"paper-84":{"id":"paper-84","name":"Why does Academia+EA produce so few online videos?","importance":1,"author":"Ozzie Gooen","karma":20,"commentCount":6},"paper-85":{"id":"paper-85","name":"EA could use better internal communications infrastructure","importance":2,"author":"Ozzie Gooen","karma":62,"commentCount":11},"paper-86":{"id":"paper-86","name":"Can GPT-3 produce new ideas? Partially automating Robin Hanson and others","importance":2,"author":"Nuño Sempere","karma":82,"commentCount":6},"paper-87":{"id":"paper-87","name":"My highly personal skepticism braindump on existential risk from artificial intelligence.","importance":2,"author":"Nuño Sempere","karma":413,"commentCount":115},"paper-88":{"id":"paper-88","name":"An in-progress experiment to test how Laplace’s rule of succession performs in practice.","importance":1,"author":"Nuño Sempere","karma":51,"commentCount":11},"paper-89":{"id":"paper-89","name":"Eli Lifland on Navigating the AI Alignment Landscape","importance":2,"author":"Ozzie Gooen","karma":48,"commentCount":9},"paper-90":{"id":"paper-90","name":"Straightforwardly eliciting probabilities from GPT-3","importance":1,"author":"Nuño Sempere","karma":38,"commentCount":5},"paper-91":{"id":"paper-91","name":"Select Challenges with Criticism & Evaluation Around EA","importance":2,"author":"Ozzie Gooen","karma":111,"commentCount":5},"paper-92":{"id":"paper-92","name":"Who is Uncomfortable Critiquing Who, Around EA?","importance":2,"author":"Ozzie Gooen","karma":144,"commentCount":15},"paper-93":{"id":"paper-93","name":"Winners of the Squiggle Experimentation and 80,000 Hours Quantification Challenges","importance":2,"author":"Nuño Sempere","karma":62,"commentCount":6}}
karma_weight = pointMass(1) 
importance_weight = SampleSet.fromDist(karma_weight * (10 to 100))
comment_multiplier = SampleSet.fromDist(3 to 10)
comment_weight = karma_weight * comment_multiplier
importance_exponent = SampleSet.fromDist(1.5 to 3.5)

score(importance, karma, comments) = (importance^(importance_exponent)  * importance_weight) + (karma) + (comments * comment_weight)

scoreById(id) = {
    item = data[id]
    score(item.importance, item.karma, item.commentCount) * (1 to 5)
}

fn(intervention1, intervention2) = [scoreById(intervention1), scoreById(intervention2)]
`,
  };
}

export function getQuriPosts(): InterfaceWithModels {
  return {
    catalog: getCatalog(),
    models: Map([getTextModel()].map((m) => [m.id, m])),
  };
}
