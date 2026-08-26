--SELECT * FROM CovidDeaths LIMIT 10;
--SELECT * FROM CovidVaccinations LIMIT 10;



-- SELECT data that we are going to be using

SELECT Location, Date, total_cases, new_cases, total_deaths*1000.0, population 
FROM CovidDeaths 
/*Where continent is not null*/
Order by 3,4



SELECT 
    location, 
    date, 
    CAST(total_cases AS REAL) AS total_cases, 
    CAST(total_deaths AS REAL) AS total_deaths
FROM CovidDeaths;



-- looking at Total cases vs Total deaths
-- shows likelihood of dying if you contract covid in your country
SELECT Location, Date, total_cases,total_deaths, (total_deaths*1.0/total_cases)*100
FROM CovidDeaths 
--order by 1,2



-- Looking at total_cases vs population
-- specifically looking at what percentage of the US population contracted covid and at what rate did they contract it
SELECT Location, Date, total_cases, population, (total_cases*1.0/population)*100
FROM CovidDeaths
WHERE location like '%states%'
order by 1,2


--Looking at countries with the highest infection rate compared to population
SELECT Location, MAX(total_cases*1.0) as HighestInfectionCount, population, Max((total_cases*1.0/population))*100 as PercentPopInfected
FROM CovidDeaths
WHERE location like '%states%'
Group By Location, population
order by 1,2


-- showing countries with the highest death count per population
SELECT Location, MAX(CAST(total_deaths AS REAL)) AS totaldeathcount
FROM CovidDeaths
/*WHERE location LIKE '%states%'*/
Where continent is not NULL
GROUP BY location
Order by totaldeathcount desc



-- trying this one instead of the above because I think the parameters are wrong
SELECT Location, MAX(CAST(total_deaths AS REAL)) AS totaldeathcount
FROM CovidDeaths
WHERE continent IS NOT NULL 
  AND continent != ''
GROUP BY location
ORDER BY totaldeathcount DESC;



--BREAKING THINGS DOWN BY CONTINENT
SELECT continent, MAX(CAST(total_deaths AS REAL)) AS totaldeathcount
FROM CovidDeaths
WHERE continent IS NOT NULL 
  AND continent != ''
GROUP BY continent
ORDER BY totaldeathcount DESC;




-- Showing continents with highest death count per population
SELECT continent, MAX(CAST(total_deaths AS REAL)) AS totaldeathcount
FROM CovidDeaths
WHERE continent IS NOT NULL 
  AND continent != ''
GROUP BY continent
ORDER BY totaldeathcount DESC;





-- GLOBAL NUMBERS

	SELECT 
    date, 
    SUM(CAST(new_cases AS REAL)) AS total_cases, 
    SUM(CAST(new_deaths AS REAL)) AS total_deaths, 
    (SUM(CAST(new_deaths AS REAL)) * 1.0 / SUM(CAST(new_cases AS REAL))) * 100 AS DeathPercentage
FROM CovidDeaths
--Where location like '%states%'
WHERE continent IS NOT NULL
--GROUP BY date
ORDER BY 1, 2;



SELECT name FROM sqlite_master WHERE type='table';



-- take a look at the covidvaccination table


--Joining these 2 tables to look at Total Populations vs Vaccinations 
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2, 3;


-- creating a rolling_vaccination window in order to show the rolling sum total vaccinations

SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations AS REAL)) OVER (
        PARTITION BY dea.location 
        ORDER BY dea.location, dea.date
    ) AS rolling_people_vaccinated,
    (rolling_people_vaccinated/population)*100
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2, 3;



-- Creating view to Store Data fro Later

Create View PercentPopulationVaccinated as 
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations AS REAL)) OVER (
        PARTITION BY dea.location 
        ORDER BY dea.location, dea.date
    ) AS rolling_people_vaccinated
 --  (rolling_people_vaccinated/population)*100
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2, 3;


