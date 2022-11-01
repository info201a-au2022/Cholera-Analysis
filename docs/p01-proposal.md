# Title of your Project: **Analysis of Cholera Cases**
**Code Name**: Cholera_Analytics

**Date:** Autumn 2022

**Authors:** Binh Kim (bkim15@uw.edu), Carter Case (ccase629@uw.edu), Marika Fong (mfong2@uw.edu)

**Affiliation:** INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Abstract:  
&nbsp;&nbsp;&nbsp;&nbsp;Our main question is: “How do health disparities in inadequate access to water and sanitation in low and middle income countries relate to cholera burden?”  We are interested in answering this question to To address this question we will compile, organize and visualize data from The World Health Organization to allow our data to be more accessible to the general public. 

## Keywords: 
- **Disease** 
- **Healthcare Access** 
- **Public Infrastructure**

## Introduction: 
&nbsp;&nbsp;&nbsp;&nbsp;Cholera is a bacterial disease that spreads through contaminated drinking water and kills up to an estimated 140 thousand people a year *(1)*. In our project, we will use data from the world health organization to determine the factors that lead to cases of cholera.  
&nbsp;&nbsp;&nbsp;&nbsp;We will use data on global cholera cases and deaths, as well as water quality and access to medicine. We will use this data to determine if medicine or clean water is more effective at preventing deaths from cholera, what types of impacts on water quality are most impactful to cholera deaths, and if cholera cases are geographically dependent. We can use our analysis to determine what kinds of aid in what locations would be the most effective in preventing deaths due to cholera.

## Problem Domain:

### Background: 
&nbsp;&nbsp;&nbsp;&nbsp;Cholera is a big running issue in places that do not have safe and clean water sources, as well as low sanitation. The amount of reported cases vary from country to country. We aim to create visualizations and data analysis that is not only accessible but also coherent to understand. With knowledge from our analysis we want to ask how we can help prevent future breakout cases *(1)*. 

### Direct and Indirect Stakeholders: 
&nbsp;&nbsp;&nbsp;&nbsp;The direct stakeholders in this project are those who are affected by cholera, or those who are at a high risk of contracting the infection. Since there are still a lot of places that struggle with access to clean water and sanitation, the risk of being directly affected by cholera is very serious. Areas such as slums, refugee camps, and displaced communities fall victim to the infection as clean water and sanitation may be hard to come by. Cholera affects both adults and children in these communities. Those who fall victim to this infection may experience severe vomiting and diarrhea. And at an extreme case, this can lead to death if not treated properly.  
&nbsp;&nbsp;&nbsp;&nbsp;The indirect stakeholders in these situations are friends and family of the victims of cholera. These are the people who have their lives indirectly affected by the infection. Having their loved ones infected can cause serious stress and anxiety that may cause other health issues to arise, especially if treatments may be hard to come by. It may not even be a loved one but if many people in a community fall victim to cholera, the environment may make it hard for people to operate and function normally on their day to day basis *(2)*. 

### Human values: 
&nbsp;&nbsp;&nbsp;&nbsp;One point of human value that we consider is the value of empathy and consideration for others. Through our data and analysis we hope to garner more attention and empathy for those who are affected by cholera or those who have loved ones harmed from this infection. This value originates from wanting to help others who are in need. 

### Potential Benefits and Harms: 
&nbsp;&nbsp;&nbsp;&nbsp;With the interventions of data and technology, there are many possible benefits that may result from this. For one, we can get a more clear observation of how the water quality of an area affects the cases of cholera recorded. We can also see how accessibility of treatments and medicine/vaccines plays a role in preventing cholera cases. Although there are harms as well, depending on who views the results of our findings. For example, people can come up with negative opinions or have negative connotations in relation to places that have a higher chance of contracting cholera *(3)*.


## Research Questions:
- Is good water quality or access to antibiotics more important for protection against cholera? We will compare cholera cases in countries with both similar water quality and countries with similar access to medicine to see how cases varied with a change in the other variable. This will show what strategy is more effective at preventing cholera.
- What impacts on water quality have the greatest impact on cholera cases and deaths? We will examine whether cholera is most dependent on handwashing, water sanitization, or defecation into drinking water. We can use this analysis to determine the best course of action if water quality is found to be the main cause of cholera.
- Where do cholera cases tend to occur and is cholera based on location? We will examine the locations of cholera outbreaks over time to see if cholera tends to appear in certain locations. We can use this information to determine where would be the greatest beneficiary of aid for prevention of cholera.

## The Data:
| Name                                              | # Observations | # Variables | URL                                                               |
|---------------------------------------------------|----------------|-------------|-------------------------------------------------------------------|
| Number of Reported Cases                          | 2470           | 3           | https://apps.who.int/gho/data/node.main.175?lang=en               |
| Number of Reported Deaths                         | 2375           | 3           | https://apps.who.int/gho/data/node.main.176?lang=en               |
| Basic and Safely Managed Sanitation Services      | -*             | -*          | https://apps.who.int/gho/data/node.main.WSHSANITATION?lang=en     |
| Basic and Safely Managed Drinking Water Services  | -*             | -*          | https://apps.who.int/gho/data/node.main.WSHWATER?lang=en          |
| Handwashing with Soap                             | 198            | 64          | https://apps.who.int/gho/data/node.main.WSHHYGIENE?lang=en        |
| Open Defecation                                   | 198            | 64          | https://apps.who.int/gho/data/node.main.WSHOPENDEFECATION?lang=en |
| Median Availability of Selected Generic Medicines | 39             | 3           | https://apps.who.int/gho/data/node.main.488?lang=en               |
*\*Some dataset servers are currently experiencing technical issues.*

&nbsp;&nbsp;&nbsp;&nbsp;Our datasets directly track the number of cholera infections and deaths, as well as rate the relative water quality and medicine access in countries across the world. These datasets will allow us to answer our research questions by directly comparing their values in different countries, thus allowing us to see how the relative changes in water quality and medicine access across countries are related to a change in the spread and mortality of cholera infections.   
&nbsp;&nbsp;&nbsp;&nbsp;All of our data was collected by the World Health Organization with the purpose of gathering the knowledge needed to create equity in global healthcare. The data collection efforts are funded by an international consortium of WHO member nations, most of which are not direct beneficiaries of most WHO services. The World Health Organization is a trustworthy source, and while the data they have collected may be underreporting some areas, the data that has been collected is trustworthy.


## Expected Implications:  
&nbsp;&nbsp;&nbsp;&nbsp;One expected implication for health organizations may be how we can help better distribute more treatments and medicine as well as how effectively we can do so. It's not only important that we know the causes and effects of this issue, but also how we can help. There may be more efficient ways of exporting or getting treatments to people who have contracted cholera or those who are at a high risk of contracting the infection. 
&nbsp;&nbsp;&nbsp;&nbsp;An implication for policymakers is how we can help pass bills or laws that reduce the pollution of water. Having clean water is essential to this issue so it would be ideal to make it so that people are being mindful of their wastes and disposables by having policies that prevent further pollution of our oceans and other water sources.
&nbsp;&nbsp;&nbsp;&nbsp;Policymakers can also pass policies that help get more clean water accessible for more people and communities across our country. Having clean water is one thing but having it available for those who need it is another topic. Possible government organizations can help with getting clean water more available for those who need it. 

## Limitations: 
&nbsp;&nbsp;&nbsp;&nbsp;The largest limitation in our project is the incompleteness in our dataset. The widespreadness of cholera infection is thought to be underreported *(2)*. The poorest countries with the worst data reporting, which may also be facing the worst cholera infections, are likely to be ignored in our dataset.  
&nbsp;&nbsp;&nbsp;&nbsp;Some of our datasets have also not been recently updated and only contain data up to 2017, making it less relevant to current cases and interventions, while others only have more recent data which will make it difficult to track historical trends.  
&nbsp;&nbsp;&nbsp;&nbsp;From a technical perspective, we might run into issues trying to determine methods of processing datafiles and joining them in a way that takes into account our varying sample sizes. The data we are using is also not uniform in that each data includes sampling sizes and population that may vary making it difficult to visualize the prevalence of cholera based on location data.  







## References: 


(1) https://www.who.int/news-room/fact-sheets/detail/cholera “Cholera.” World Health Organization, World Health Organization, 30 Mar. 2022, https://www.who.int/news-room/fact-sheets/detail/cholera. 

(2) https://www.cdc.gov/cholera/infection-sources.html “Sources of Infection & Risk Factors.” Centers for Disease Control and Prevention, Centers for Disease Control and Prevention, 13 Apr. 2022, https://www.cdc.gov/cholera/infection-sources.html. 

(3) https://www.who.int/emergencies/disease-outbreak-news/item/2022-DON415  “Cholera - Haiti.” World Health Organization, World Health Organization, 12 Oct. 2022, https://www.who.int/emergencies/disease-outbreak-news/item/2022-DON415. 
