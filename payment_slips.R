# Function to generate random names
generate_names <- function() {
    first_names <- c("Achieng", "Mwangi", "Wanjiku", "Otieno", "Mutiso", "Chebet", "Kamau", "Njeri", "Kiprono", "Odhiambo")
    last_names <- c("Omondi", "Wambua", "Wafula", "Mutua", "Kariuki", "Ochieng", "Muthoni", "Chege", "Cheruiyot", "Barasa")
    paste(sample(first_names, 1), sample(last_names, 1))
}

# Function to create a list of 400 workers with random names, gender, and salary
generate_workers <- function(n=400) {
    workers <- data.frame(
        name = character(n),
        gender = character(n),
        salary = numeric(n),
        stringsAsFactors = FALSE
    )
    
    for (i in 1:n) {
        tryCatch({
            workers$name[i] <- generate_names()
            workers$gender[i] <- sample(c("Male", "Female"), 1)
            workers$salary[i] <- sample(5000:35000, 1)
        }, error = function(e) {
            cat("Error generating worker:", i, "\n")
        })
    }
    return(workers)
}

# Function to create and print payment slips
generate_payment_slips <- function(workers) {
    for (i in 1:nrow(workers)) {
        tryCatch({
            name <- workers$name[i]
            gender <- workers$gender[i]
            salary <- workers$salary[i]
            level <- "Unclassified"
            
            # Apply rules for assigning employee level
            if (salary > 10000 && salary < 20000) {
                level <- "A1"
            }
            if (salary > 7500 && salary < 30000 && gender == "Female") {
                level <- "A5-F"
            }
            
            # Print payment slip
            cat(sprintf("Slip %d: %s | Gender: %s | Salary: $%d | Level: %s\n", i, name, gender, salary, level))
        }, error = function(e) {
            cat("Error processing worker", i, ":", e$message, "\n")
        })
    }
}

# Run the main logic
workers <- generate_workers()
generate_payment_slips(workers)