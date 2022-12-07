library("shiny")
library("plotly")
library("bslib")
#---------------------------------------------------
#intro

intro_panel <- tabPanel("Project Overview",
                           sidebarLayout(
  sidebarPanel(
    
    h3("Background: What is Cholera?"),
    p("Cholera is an infection caused by the ingestion of bacterium Vibrio cholerae that affects humans digestive tract and causes severe acute watery diarrhea. Cholera is a threat to public health across the globe, and remains a strong indicator of inequity and lack of social development in many countries (World Health Organization). It is easily spread through fecal bacteria and persists through harsh environments, enhanced by lack of public health infrastructure including medicine, hygiene, and access to clean water."),
    
    p("The majority of cholera cases result in mild-moderate cases, with a minority developing severe symptoms that lead to death if left untreated. Due to cholera’s rapid spread in certain communities, this can lead to millions of deaths. Researchers estimate that there are up to 4 million new cases globally each year and 140,000 deaths due to cholera. In just 8 months cholera killed 10,000 residents in Haiti of the infected 820,000 in 2010. Today, cholera is an endemic in approximately 50 countries."),
    
    h3("Why it matters:"),
    p("Researching cholera as a topic in data science is important because it allows us to model trends and patterns across the globe in high-resolution and highly-scalable lenses. This allows public health researchers, doctors, activists, and so on to develop methods in response to cholera and invent solutions to fight the pandemic. As a key indicator of inequity and lack of social development, it also allows social sciences to develop their own models to fight inequity and give a voice for underserved communities around the world."),
    
    p(strong("Our mission"), "is to bring awareness to the cholera pandemic and create datasets/visualizations that are impactful, meaningful, interactive, and relevant to fighting cholera and social injustices."),
    
    h3("Research questions:"),
    p("The main research question we are investigating is what impact does access to medicine or better hygiene practices have on cholera outbreaks and mortality rates, where it exists. We are aiming to determine through real data which practices are viable for cholera management as well as create visualizations for the distribution of cholera. This allows us to procure better answers to deal with cholera as well as create geographic cholera trends to begin preventative steps."),
    
    h3("Our datasets:"),
    p("Our research uses data from the World Health Organization’s ‘Global health observatory’ and includes global cholera data on WHO’s 194 member countries on cases, deaths, distrubution of cholera medical supplies, as well as data on handwashing and open defecation. It takes data as early as 1949 to 2017. GHO uses many methodologies to collect data, focusing on comparable values across time and countries. They aim to collect data as accurate as possible, allow the country to review and revise their own data, and they are constantly updated as more data becomes available.")
    
    h3("Authors"),
    p("Binh Kim (bkim15@uw.edu), Art Major / Informatics minor"),
    p("Brandon Vuong (vuongb@uw.edu), Biology/Informatics Major"),
    p("Carter Case (ccase629@uw.edu), Chemical Engineering Major"),
    p("Marika Fong (mfong2@uw.edu) Public Health-Global Health Major/ Data Science minor")
  ), 
  
  mainPanel(
    img(src = "https://news.mit.edu/sites/default/files/styles/news_article__image_gallery/public/images/201806/MIT-Living-Therapeutics_0.jpg")
  )
))


#---------------------------------------------------
#Deathrate
deathrate_tab <- tabPanel(
  "Deathrate",
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "years",
        "Time",
        min = min(deathrate_data$Year),
        max = max(deathrate_data$Year),
        value = c(min(deathrate_data$Year), max(deathrate_data$Year))
      )
    ),
    mainPanel(
      plotlyOutput(outputId = "deathrate_graph"),
      h3("Takeaways"),
      p("While there is a general upward trend of the data, the large clusters suggest that the death rate of Cholera is quite uneven throughout the world. In addition, while the largest number of cholera cases over all time has been in India, modern data shows more cases of cholera appearing in African countries.")
    )
  )
)
#------------------------------------------------------
#Cases/Handwash

## adding theme to tab for cases and handwashing graph
handwashing_tab <-  tabPanel(
  "Cholera Cases vs Handwashing",
  fluidPage(theme = bs_theme(bootswatch = "minty")))

## year selection slide bar
year_select <- sliderInput(
  "chw_years",
  "Time",
  min = min(cases_handwashing_data$Year),
  max = max(cases_handwashing_data$Year),
  value = c(min(cases_handwashing_data$Year), max(cases_handwashing_data$Year))
)

##  selection sidebar
country_sidebar <- sidebarPanel(
  selectInput(
    inputId = "Country",
    label = "Country",
    choices = unique(cases_handwashing_data$Country),
    multiple = TRUE,
    selected = "Congo"
  ),
  year_select
)

## adding interactive plot
handwashing_plot <- mainPanel(
  plotlyOutput(outputId = "cases_handwashing_graph")
)


## tab for interactive graph 
handwashing_tab <- tabPanel(
  "Cases v.s. Handwashing Graph",
  sidebarLayout(
    country_sidebar,
    handwashing_plot
  ),
  
  ## graph description 
  h1("Description"),
  p("This graph shows the disribution in the number of cholera cases globally from 2000-2018 with relation to the percentage of the population with basic handwashing facilities at home. The size of each bubble represents the number of deaths per country"),
  
  ## page footer
  p("INFO 201 | Autumn 2022 | Marika Fong, Carter Case, Bihn Kim, Brandon Vuong", align = "center"),
  p("Link to ", a(strong(code("INFO201-Final-Project")), href = "https://github.com/info201a-au2022/project-group-4-section-af"), align = "center")
)
#-------------------------------------------------------------------------
# Deaths/Medicine

# Tab for graph
deaths_medicine_tab <- tabPanel("Deaths and Medicine",
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectCountry")
    ),
    mainPanel(
      plotlyOutput("countryPlot"),
      p(em("*Some countries may not have a chart comparing the two factors due to a deficiency of surveys conducted by WHO(World Health Organization). Availability of results may vary for different countries."), style ="font-size:10px;"),
      h3("What does it mean?"),
      p("While looking at this chart we are able to see the total deaths recorded over the span of 2007 to 2013, and the median percentage of generic medicine available for a selected country over the same span of years. From further analyzing the results, it can be seen that a country with a lower percentage of accessibility to medicine tends to have a higher overall death toll.")
    )
  ))

#-------------------------------------------------------------------------
#Conclusion
final_tab <- tabPanel(
  "Findings",
  h1("Conclusion:"),
  p("Our data and visualizations lead us to believe that cholera remains the most prominent in the African continent. It also appears commonly in Southeast Asia and poverty or war-stricken countries like Haiti, the poorest country in the western hemisphere. Cholera was driven out due to industrialization and sanitation practices, and only requires simple rehydration therapy to treat it. We still see its appearance in poor countries with lack of sanitation, especially after wars, natural disasters, or poverty. Cholera outbreaks are a strong indicator of under-developed countries that haven’t industrialized or set-up sanitation practices, or are still reeling from the impact of a war or natural disaster."),
  p("Our findings support that sanitation practices may be more efficient at preventing cholera outbreaks.")
)

#-------------------------------------------------------------------------
#UI

ui <- navbarPage(
  "Analysis of Global Trends in Cholera",
  tabsetPanel(
    intro_panel,
    deathrate_tab,
    handwashing_tab,
    deaths_medicine_tab,
    final_tab
  ),
  theme = bs_theme(version = 5, bootswatch = "superhero")
)
