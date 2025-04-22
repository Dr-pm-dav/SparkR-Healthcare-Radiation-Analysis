# Big Data Tools in Healthcare

## Using Spark, R, and Docker to Analyze Radiation Sampling
To demonstrate the real-world applicability of big data tools in healthcare analytics, a radiation exposure analysis pipeline was implemented using Apache Spark, R, and RStudio, and executed with Docker containers. This setup showcases schema-on-read flexibility, distributed processing, and a polyglot analytical environment aligned with the themes described in an article by Shakyawar et al. (2022).

### Environment Setup
A Spark cluster using Docker was deployed and configured to run in standalone mode, accessible at **spark://spark-master:7077**. A second container hosted RStudio Server, where the sparklyr package facilitated integration between Spark and R. The radiation dataset, a CSV file containing quarterly airborne radionuclide measurements (California Department of Public Health, 2025), was mounted into the container via a shared volume.

### Data Ingestion and Preprocessing
The dataset was ingested using **spark_read_csv()**, with **infer_schema = TRUE** to allow Spark to automatically determine data types. This directly applied the schema-on-read principle, enabling the ingestion of varied environmental measurements without the need for a rigid schema.

Key columns included sampling period, location, radionuclide, and total effective dose equivalent. Relevant fields were converted into a numeric format and filtered for incomplete entries.

### Exploratory Analysis and Visualization
The mean radiation dose per radionuclide was computed using **dplyr** operations in Spark. This summary was visualized in R using **ggplot2**, which produced a horizontal bar chart highlighting the relative contributions of exposure by radionuclide.

### Feature Engineering and Predictive Modeling
Using Spark's MLlib, a linear regression model was constructed to predict radiation dose from three features: radionuclide type, sampling location, and measured activity level. The model's predictions were then extracted and evaluated. The results demonstrated meaningful associations between sampling features and estimated radiation exposure, validating the analytic pipeline for environmental health applications.

### Infrastructure and Scalability
Docker ensured reproducibility and modularity. The Spark engine handled distributed processing, allowing the system to scale with larger datasets—an essential feature for longitudinal public health surveillance.

By integrating Apache Spark's scalability, R's analytical expressiveness, and Docker's portability, this implementation supports real-time environmental health monitoring. It offers a blueprint for proactive exposure analysis relevant to healthcare analytics, emergency response, and epidemiological modeling.

## Justification of Radiation Surveillance as Healthcare Data
Radiation surveillance data is healthcare-related due to its epidemiological relevance and regulatory parallels. Recent studies have demonstrated strong scientific evidence linking environmental radiation exposure to adverse health outcomes such as cardiovascular diseases and cancer (Bahrami Asl et al., 2023; Egbueri et al., 2025; Manenti et al., 2024; Peters et al., 2023).

It is crucial to recognize radiation surveillance data as healthcare-related data, and this project treats it as such for the following reasons:

 - **Epidemiological Evidence.** Chronic low-dose exposure to ionizing radiation contributes to increased risks of cardiovascular diseases such as ischemic heart disease and stroke, as well as hematologic abnormalities (Peters et al., 2023). For instance, Peters et al. (2023) conducted a meta-analysis revealing that occupational low-dose radiation exposure is significantly associated with increased ischemic heart disease mortality. Bahrami Asl et al. (2023) observed elevated levels of inflammatory cytokines (e.g., IL-6) and hematological changes among nuclear industry workers, reinforcing the systemic health implications of radiation exposure.

- **Regulatory and Dosimetric Parallels.** Units of radiation measurement used in environmental health surveillance (e.g., millisieverts or millirems) mirror those used in clinical radiation medicine. The U.S. Nuclear Regulatory Commission (NRC) defines acceptable exposure limits in the same metrics used to evaluate medical imaging or radiotherapy. Thus, dose monitoring in environmental contexts operates within the same framework of clinical dosimetry, functioning as a preventive extension of public health.

 - **Public Health and Oncologic Risk.** Environmental radionuclides are classified as long-term health hazards. Egbueri et al. (2025) emphasize that while many communities remain within regulatory dose limits, localized hotspots of radionuclide contamination can increase risks for conditions such as lung cancer and thyroid disease. These findings align with established epidemiological models, which recognize low-dose, chronic exposure as a cumulative factor that increases the risk of cancer. Consequently, tracking and analyzing radiation data are vital aspects of healthcare-informed risk prediction and mitigation.

Radiation surveillance programs, therefore, serve as critical infrastructure in population health strategy, paralleling the objectives of clinical monitoring. Integrating such data into healthcare analytics enhances the ability to make data-informed decisions that benefit both individual and public health outcomes.


#### References
Bahrami Asl, F., Islami-Seginsara, M., Ebrahimi Kalan, M., et al. (2023). **Exposure to ionizing radiations and changes in blood cells and interleukin-6 in radiation workers.** Environmental Science and Pollution Research, 30(26), 35757–35768. https://doi.org/10.1007/s11356-022-24652-8

California Department of Public Health. (2025, April 19). **Radiological air sample quarterly composites [Dataset].** HealthData.gov. https://healthdata.gov/d/2gd6-gjp9

Egbueri, J. C., Agbasi, J. C., Aralu, C. C., Abu, M., Uwajingba, H. C., & Abba, S. I. (2025). **Radionuclides as environmental contaminants of concern: Threats to public health through soil and groundwater.** In P. Li, X. He, J. Wu, & V. Elumalai (Eds.), Sustainable Groundwater and Environment: Challenges and Solutions (Chap. 15). Springer. https://doi.org/10.1007/978-3-031-82194-3_15

Manenti, A., Bagnardi, V., Rotolo, C., et al. (2024). **Cardiovascular and circulatory disease risk from chronic radiation exposure: A systematic review.** European Heart Journal, 45(1), 82–94. https://doi.org/10.1093/eurheartj/ehad675

Peters, C. E., Quinn, E. K., Rodriguez-Villamizar, L. A., MacDonald, H., & Villeneuve, P. J. (2023). **Exposure to low-dose radiation in occupational settings and ischaemic heart disease: A systematic review and meta-analysis.** Occupational and Environmental Medicine, 80(12), 706–714. https://doi.org/10.1136/oemed-2023-108865

Shakyawar, D. B., Rawat, B., & Saxena, A. (2022). **Big data in healthcare: Management, analysis and future prospects.** Journal of King Saud University – Computer and Information Sciences, 34(5), 1731–1741. https://doi.org/10.1016/j.jksuci.2022.03.012



