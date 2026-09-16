# COVID-19 Data Exploration Project

> **Tools Used:** SQL Server (SSMS), Excel, GitHub, Tableau (Public)  
> **Dataset:** Our World in Data (OWID) Global COVID-19 Dataset

---

## 🔍 1. Key Insights

* **Global Progression Over Time:** The pandemic evolved rapidly from early 2020 baseline figures of negligible infection numbers to tens of millions of confirmed cases globally by late 2021 and beyond.
* **Geographical Discrepancies:** Infection and mortality burdens heavily concentrated in major global regions, influenced by population density, healthcare infrastructure, and government intervention timing.
* **Vaccination Rollout Tracking:** Large-scale distribution began globally in late 2020 / early 2021 (e.g., December 2020 in Canada), leading to progressive compounding protection tracked via rolling metrics.

---

## 📊 2. Key Findings

* **Infection vs. Population Impact:** Maximum infection counts showed significant portions of top nations reaching high percentages of total population exposure (ranging from single-digit percentages early on to over 10–30% in heavily impacted countries).
* **Mortality Rate Fluctuations:** Early-stage infection-to-death ratios (case fatality rates) hovered around 2% to 4%+ globally, shifting as testing capacity broadened, treatments improved, and variants mutated.
* **Global Aggregates:** Total worldwide case counts scaled past 150 million mid-pandemic with a global death percentage sitting consistently around ~2%.
* **Data Cleaning & Handling:** Handling missing values, filtering out continent-level summary rows (`WHERE continent IS NOT NULL`), and casting data types (`CAST(... AS INT)`) were essential to executing accurate aggregate functions (`SUM`, `MAX`) and avoiding syntax errors.

---

## 📈 3. Visualization

* **Global Infection Waves Line Chart:** Tracking daily new cases and new deaths across a temporal timeline.
* **Geographical Map (Tableau):** Visualizing infection rates and mortality counts across continents and specific country drill-down layers.
* **Vaccination Cumulative Growth Area Chart:** Illustrating rolling totals of people vaccinated versus total population per country over time.

---

## 💡 4. Recommendations

**Prioritize High-Risk and Low-Coverage Regions:** Direct mobile vaccination units and targeted public health outreach toward communities and regions where immunization growth is plateauing relative to total population size.
* **Refine Public Health Communication Strategy:** Shift away from broad, one-size-fits-all messaging toward localized advisory campaigns that reflect real-time transmission rates and seasonal outbreak patterns.
* **Strengthen Healthcare Capacity Planning:** Utilize historical lag-time patterns between infection surges and hospital strain to preemptively distribute medical supplies, personal protective equipment (PPE), and staffing resources before local systems reach capacity.
* **Improve Cross-Agency Data Transparency:** Standardize data collection and reporting criteria across municipal, state, and national levels to eliminate reporting delays (such as weekend reporting drop-offs) and ensure decision-makers rely on clear, unified metrics.
---
