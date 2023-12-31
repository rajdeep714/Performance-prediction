# Performance-prediction
This repo contains codes for generating a dataset of performance counters from different computers while executing SPECrate 17 benchmarks and using machine learning models to predict the performance of a new system from the data of performance counters from another system.  
The datasets for this experiment was collected for an i5-9th gen, i5-11th gen, i7-9th gen and an AMD system running on Ubuntu operating system. Datasets of twelve performance counters were generated for each of these systems (five of them being performance metrics) using the `perf stat` command.  
Also a dataset of 74 performance counters is generated for the i5-9th gen system for performing feature selection. Another dataset of perf counters while running nine Unixbench workloads are also generated, to use for cross-benchmark prediction for the i5 system.

## Dataset generation
1. Install SPEC 17 benchmark suite in the system.
2. Create a config file, edit the label name as `perfcount` (line 58). Edit the compiler path in line 154. Leave other options as default.
3. Run the following commands from inside the SPEC installation folder to setup directories for the SPECrate benchmarks:  
   `runcpu --fake --loose --config [config_file_name] --size ref --tuning peak specrate ^503 ^521 ^527  
    runcpu --fake --loose --config [config_file_name] --size ref --tuning base 503 521 527`
4. Copy all the contents of the folder `Performance counter dataset generation` in this repository to the SPEC installation folder of the system. Also give exection permission to the shell scripts thus copied.
5. Execute `build_SPECrate.sh` to build the SPECrate benchmarks.
6. Execute `generate_counters.sh` and `generate_metrics.sh` to execute all benchmarks and generate performance counter and metric dataset. The runtime and repetitions for each benchmark execution can be set in the script file. The output is stored in `benchspec/CPU/perf_counter.txt` and `benchspec/CPU/perf_metric.txt`.
7. Run the `parser.c` program to generate CSV files `dataset_cycles.csv` and `dataset_metrics.csv` from the two output text files. Merge them and average the `cycles` column from both datasets.

## Feature selection and regression
The notebook `Feature selection on big dataset-i5.ipynb` uses the `dataset_i5-9gen_big.csv` dataset to compute feature importances and perform hierarchical clustering for feature selection. The machine learning models used for regression are: Linear,	Decision Tree, Random Forest,	XG Boost, KNN and MLP.  
It outputs the plots for R2 score of regression for each model against training size used for a set of number of input features used among 1, 6, 11, and 16.

## Cross-architecture performance prediction
The three notebook files `Cross-prediction between i5 and AMD.ipynb`, `Cross-prediction between i5 and i7.ipynb` and `Cross-prediction between i5-9 and i5-11.ipynb` use the four systems' datasets to perform cross-architecture performance prediction.  
They output the plots for R2 score of regression for each model against training size used for cross-prediction in both directions for the two systems.

## Cross-benchmark performance prediction
The nontebook `Bechmark cross-prediction spec-unix.ipynb` uses `dataset_i5-9gen.csv` and `dataset_i5-9gen_unix.csv` to perform cross-benchmark performance prediction for the i5-9th gen system.  
They output the plots for R2 score of regression for each model against training size used for cross-prediction in both directions for the SPEC and Unixbench suites.
