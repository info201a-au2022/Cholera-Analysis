# Analysis of Cholera Cases

**Code Name:  Cholera_Analytics**
=======
# Title of your Project: **Analysis of Cholera Cases**
**Code Name**: Cholera_Analytics

**Date:** Autumn 2022

**Authors:** Binh Kim (bkim15@uw.edu), Carter Case (ccase629@uw.edu), Marika Fong (mfong2@uw.edu), Brandon Vuong (vuongb@uw.edu)

**Affiliation:** INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Abstract:  
Our main question is: “How do health disparities in inadequate access to water and sanitation in low and middle income countries relate to cholera burden?”  We are interested in answering this question to see to areas we can improve on to reduce cholera cases and deaths. To address this question we will compile, organize and visualize data from The World Health Organization to allow our data to be more accessible to the general public. 

## Keywords: 
- **Disease** 
- **Healthcare Access** 
- **Public Infrastructure**

## Introduction: 
Cholera is a bacterial disease that spreads through contaminated drinking water and kills up to an estimated 140 thousand people a year *(1)*. In our project, we will use data from the world health organization to determine the factors that lead to cases of cholera.  
We will use data on global cholera cases and deaths, as well as water quality and access to medicine. We will use this data to determine if medicine or clean water is more effective at preventing deaths from cholera, what types of impacts on water quality are most impactful to cholera deaths, and if cholera cases are geographically dependent. We can use our analysis to determine what kinds of aid in what locations would be the most effective in preventing deaths due to cholera.

## Problem Domain:

### Background: 
Cholera is a big running issue in places that do not have safe and clean water sources, as well as low sanitation. The amount of reported cases vary from country to country. We aim to create visualizations and data analysis that is not only accessible but also coherent to understand. With knowledge from our analysis we want to ask how we can help prevent future breakout cases *(1)*. 

### Direct and Indirect Stakeholders: 
The direct stakeholders in this project are those who are affected by cholera, or those who are at a high risk of contracting the infection. Since there are still a lot of places that struggle with access to clean water and sanitation, the risk of being directly affected by cholera is very serious. Areas such as slums, refugee camps, and displaced communities fall victim to the infection as clean water and sanitation may be hard to come by. Cholera affects both adults and children in these communities. Those who fall victim to this infection may experience severe vomiting and diarrhea. And at an extreme case, this can lead to death if not treated properly.  
The indirect stakeholders in these situations are friends and family of the victims of cholera. These are the people who have their lives indirectly affected by the infection. Having their loved ones infected can cause serious stress and anxiety that may cause other health issues to arise, especially if treatments may be hard to come by. It may not even be a loved one but if many people in a community fall victim to cholera, the environment may make it hard for people to operate and function normally on their day to day basis *(2)*. 

### Human values: 
One point of human value that we consider is the value of empathy and consideration for others. Through our data and analysis we hope to garner more attention and empathy for those who are affected by cholera or those who have loved ones harmed from this infection. This value originates from wanting to help others who are in need. 

### Potential Benefits and Harms: 
With the interventions of data and technology, there are many possible benefits that may result from this. For one, we can get a more clear observation of how the water quality of an area affects the cases of cholera recorded. We can also see how accessibility of treatments and medicine/vaccines plays a role in preventing cholera cases. Although there are harms as well, depending on who views the results of our findings. For example, people can come up with negative opinions or have negative connotations in relation to places that have a higher chance of contracting cholera *(3)*.


## Research Questions:
- Is good water quality or access to antibiotics more important for protection against cholera? We will compare cholera cases in countries with both similar water quality and countries with similar access to medicine to see how cases varied with a change in the other variable. This will show what strategy is more effective at preventing cholera.
- What impacts on water quality have the greatest impact on cholera cases and deaths? We will examine whether cholera is most dependent on handwashing, water sanitization, or defecation into drinking water. We can use this analysis to determine the best course of action if water quality is found to be the main cause of cholera.
- Where do cholera cases tend to occur and is cholera based on location? We will examine the locations of cholera outbreaks over time to see if cholera tends to appear in certain locations. We can use this information to determine where would be the greatest beneficiary of aid for prevention of cholera.

## The Data:
| Name                                              | # Observations | # Variables | URL                                                               |
|---------------------------------------------------|----------------|-------------|-------------------------------------------------------------------|
| Number of Reported Cases                          | 2470           | 3           | https://apps.who.int/gho/data/node.main.175?lang=en               |
| Number of Reported Deaths                         | 2375           | 3           | https://apps.who.int/gho/data/node.main.176?lang=en               |
| Handwashing with Soap                             | 198            | 64          | https://apps.who.int/gho/data/node.main.WSHHYGIENE?lang=en        |
| Median Availability of Selected Generic Medicines | 39             | 3           | https://apps.who.int/gho/data/node.main.488?lang=en               |  


Our datasets directly track the number of cholera infections and deaths, as well as rate the relative water quality and medicine access in countries across the world. These datasets will allow us to answer our research questions by directly comparing their values in different countries, thus allowing us to see how the relative changes in water quality and medicine access across countries are related to a change in the spread and mortality of cholera infections.   
All of our data was collected by the World Health Organization with the purpose of gathering the knowledge needed to create equity in global healthcare. The data collection efforts are funded by an international consortium of WHO member nations, most of which are not direct beneficiaries of most WHO services. The World Health Organization is a trustworthy source, and while the data they have collected may be underreporting some areas, the data that has been collected is trustworthy.


## Expected Implications:  
One expected implication for health organizations may be how we can help better distribute more treatments and medicine as well as how effectively we can do so. It's not only important that we know the causes and effects of this issue, but also how we can help. There may be more efficient ways of exporting or getting treatments to people who have contracted cholera or those who are at a high risk of contracting the infection. 
An implication for policymakers is how we can help pass bills or laws that reduce the pollution of water. Having clean water is essential to this issue so it would be ideal to make it so that people are being mindful of their wastes and disposables by having policies that prevent further pollution of our oceans and other water sources.
Policymakers can also pass policies that help get more clean water accessible for more people and communities across our country. Having clean water is one thing but having it available for those who need it is another topic. Possible government organizations can help with getting clean water more available for those who need it. 

## Limitations: 
The largest limitation in our project is the incompleteness in our dataset. The widespreadness of cholera infection is thought to be underreported *(2)*. The poorest countries with the worst data reporting, which may also be facing the worst cholera infections, are likely to be ignored in our dataset.  
Some of our datasets have also not been recently updated and only contain data up to 2017, making it less relevant to current cases and interventions, while others only have more recent data which will make it difficult to track historical trends.  
From a technical perspective, we might run into issues trying to determine methods of processing datafiles and joining them in a way that takes into account our varying sample sizes. The data we are using is also not uniform in that each data includes sampling sizes and population that may vary making it difficult to visualize the prevalence of cholera based on location data.  

## Findings:  
Our findings from research show that the African continent has the most cases and deaths of cholera, followed by southeast Asia. Cholera also appears in Haiti, the poorest country in the western hemisphere. This is consistent with the hypothesis that countries with low sanitation practices and countries reeling after wars or natural disasters are especially inflicted with Cholera.  
Our research also suggests that countries who have higher percentages of handwashing population have less cases of cholera. When comparing two countries, such as Haiti and the Congo, which have the same amount of median medicine, Congos handwashing population is 23% higher than Haiti’s and the Congo has less active cholera cases. This could also be related to clean water access, since cholera is most commonly spread through water. This trend follows with the majority of countries. Median distribution of medicine does have a significant impact on cholera cases as well, showing the trend that countries with higher access to medicine have less cases and deaths, although it makes a smaller impact than hand-washing.  
Cholera remains a strong key indicator of social inequalities across the globe. As a relatable and comparable unit of measurement, we are able to use this data to gauge a country's current healthcare development, as well as their level of sanitation (Access to clean water, high-density population communities, natural disaster). This allows researchers to make inferences based on consistent trends about which countries are under-developed.  

## Discussion:  
From our findings and results from data visualizations, we were able to gain a better understanding of cholera breakout trends as well as major problems that lead to said outbreaks and even deaths. Going into this project we asked and observed what impact does accessibility to medicine and hygiene practices tell us about cholera outbreaks. After answering these questions, we realized that there are many other factors that contribute to the overall issue. Though hygiene and health care are key players, there are other factors that we now understand that are just as important such as population density as well as geographical location. This implies that solving the issue of this pandemic will not start with easy solutions. Clean drinking water is still a privilege and an amenity that many places across the world are still struggling to obtain. But that also goes for health care. A country with low access to generic medicine or not easily obtainable health care services will suffer more damages from cholera. This implies that we need to look further into a country’s socio economic standings and issues to see if providing better health care is possible as well as looking into the advancement of generic medicine. Third world countries will not have access to the same medical treatments as first world countries, so the solutions to prevent cholera deaths will be different from country to country. This also applies to hygiene practices. Accessibility to basic sanitation varies from countries. What this all implies is that although there are factors such as geographical locations that can’t be controlled, the problems can be traced to a country's socioeconomic standing. The importance of our findings points to major causes of the outbreaks and overall death toll, but it also gave us a bigger picture of the overall issue. Providing better generic medicine to the public and getting better hygiene practices are only the starting point and won’t fix the problem entirely.

## Conclusion:  
While cholera may be seen as a non-issue in more industrialized nations, it still affects thousands of people worldwide every year. Particularly in developing, low income countries, where the causes of cholera are not as easily dealt with, it is a major health hazard.  
Our research showed that cholera does not affect all countries equally. The rate of cholera infection varies wildly even sometimes between nations in similar areas. What did seem to affect the rate of cholera is socioeconomic status. While hand washing and access to medicines did help against cholera, the largest deciding factor in the number of cases and deaths was a country’s development.   
We started this project with the goal of developing a strategy to combat the prevalence of cholera in low income countries. We thought that this might come in the form of campaigns to increase hand washing or aid to increase medicinal access. It turns out, the best way that any country can prevent the spread of cholera is by having money to spend, which is easier said than done. That being said, both hand washing and medicine do decrease the rates of cholera, and so both should be encouraged and supported.
Ultimately, cholera will likely continue to be a large problem until all nations have the significant economic resources required to deal with the root causes and eradicate it. Until then, proper hand washing should be encouraged and every effort should be made to increase access to medicine, to decrease the impact of cholera until it can be eradicated.  





## References: 


(1) “Cholera.” World Health Organization, World Health Organization, 30 Mar. 2022, https://www.who.int/news-room/fact-sheets/detail/cholera. 

(2) “Sources of Infection & Risk Factors.” Centers for Disease Control and Prevention, Centers for Disease Control and Prevention, 13 Apr. 2022, https://www.cdc.gov/cholera/infection-sources.html. 

(3) “Cholera - Haiti.” World Health Organization, World Health Organization, 12 Oct. 2022, https://www.who.int/emergencies/disease-outbreak-news/item/2022-DON415. 

(4) “Gho | by Category | Number of Reported Cases - Data by Country.” World Health Organization, World Health Organization, https://apps.who.int/gho/data/node.main.175?lang=en.  

(5) “Gho | by Category | Number of Reported Deaths - Data by Country.” World Health Organization, World Health Organization, https://apps.who.int/gho/data/node.main.176?lang=en.  

(6) “Gho | by Category | Basic and Safely Managed Sanitation Services - Data by Country.” World Health Organization, World Health Organization, https://apps.who.int/gho/data/node.main.WSHSANITATION?lang=en.  

(7) “Gho | by Category | Basic and Safely Managed Drinking Water Services - Data by Country.” World Health Organization, World Health Organization, https://apps.who.int/gho/data/node.main.WSHWATER?lang=en.  

(8) “Gho | by Category | Handwashing with SOAP - Data by Country.” World Health Organization, World Health Organization, https://apps.who.int/gho/data/node.main.WSHHYGIENE?lang=en.  

(9) “Gho | by Category | Open Defecation - Data by Country.” World Health Organization, World Health Organization, https://apps.who.int/gho/data/node.main.WSHOPENDEFECATION?lang=en.  

(10) “Gho | by Category | Median Availability of Selected Generic Medicines - Data by Country.” World Health Organization, World Health Organization, https://apps.who.int/gho/data/node.main.488?lang=en. 

