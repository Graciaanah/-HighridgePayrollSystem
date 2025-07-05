import random

# Function to generate random names by combining first and last names
def generate_names():
    first_names = ["Achieng", "Mwangi", "Wanjiku", "Otieno", "Mutiso", "Chebet", "Kamau", "Njeri", "Kiprono", "Odhiambo"]
    last_names = ["Omondi", "Wambua", "Wafula", "Mutua", "Kariuki", "Ochieng", "Muthoni", "Chege", "Cheruiyot", "Barasa"]
    return f"{random.choice(first_names)} {random.choice(last_names)}"

# Function to create a list of workers dynamically
def generate_workers(num_workers=400):
    workers = []
    for _ in range(num_workers):
        try:
            # Generate name, gender, and salary for each worker
            name = generate_names()
            gender = random.choice(['Male', 'Female'])
            salary = random.randint(5000, 35000)

            # Add worker to list
            workers.append({
                "name": name,
                "gender": gender,
                "salary": salary
            })
        except Exception as e:
            print(f"Error generating worker: {e}")
    return workers

# Function to generate payment slips for each worker
def generate_payment_slips(workers):
    for i, worker in enumerate(workers, start=1):
        try:
            name = worker["name"]
            gender = worker["gender"]
            salary = worker["salary"]
            level = "Unclassified"

            # Assign level based on salary and gender
            if 10000 < salary < 20000:
                level = "A1"
            if 7500 < salary < 30000 and gender == "Female":
                level = "A5-F"

            # Print the payment slip
            print(f"Slip {i}: {name} | Gender: {gender} | Salary: ${salary} | Level: {level}")
        except Exception as e:
            print(f"Error processing worker #{i}: {e}")

# Main program execution
if __name__ == "__main__":
    workers = generate_workers()
    generate_payment_slips(workers)