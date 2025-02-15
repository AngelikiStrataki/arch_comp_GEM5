# arch_comp_GEM5


ΑΡΧΙΤΕΚΤΟΝΙΚΗ ΥΠΟΛΟΓΙΣΤΩΝ-Εισαγωγή στον Εξομοιωτή gem5



Ονοματεπώνυμο: Στρατάκη Αγγελική
ΑΕΜ: 10523
Email: angeliksi@ece.auth.gr
Ημερομηνία: Ιανουάριος 2025












ΜΕΡΟΣ ΠΡΩΤΟ
Βήμα 1ο
Χρησιμοποίησαμε το έτοιμο ένα πρόγραμμα virtualization, συγκεκριμένα το VM VMWare Workstation Player 15.

Βήμα 2ο
Ερωτήματα Πρώτου Μέρους 1
	Στο αρχείο starter_se.py εντοπίσαμε τις βασικές παραμέτρους του συστήματος που πρόκειται να εξομοιωθεί από τον gem5.
	Τύπος CPU, 
 	
  	Caches:
 
![εικόνα](https://github.com/user-attachments/assets/e1ceb820-c1af-4e40-ae92-03a23e49a564)
![εικόνα](https://github.com/user-attachments/assets/8628a6c8-ffc8-47a5-ad7f-2cface063b0f)
 

	Συχνότητα Λειτουργίας (Clock Frequency):
 ![εικόνα](https://github.com/user-attachments/assets/5f259e21-aefb-45c6-8ceb-5036fe9d91b9)



 
	Φυσική μνήμη (RAM):
 ![εικόνα](https://github.com/user-attachments/assets/99f96ba8-0670-44b4-b33b-315eeeeb6123)

 
	Τύπος μνήμης:
 ![εικόνα](https://github.com/user-attachments/assets/aba50543-2627-4e72-acf7-ab5d24f3417a)

 
	Αριθμός πυρήνων:
 ![εικόνα](https://github.com/user-attachments/assets/198326a5-13a6-46d2-9677-3eeabbe3cce7)

 
	Cache Line Size:
 ![εικόνα](https://github.com/user-attachments/assets/64a0b0db-531c-4cf8-a687-06ac3784daf7)


	Bus (Δίαυλος μνήμης):
![εικόνα](https://github.com/user-attachments/assets/34f6b825-a315-4ea7-a673-fbf515d99812)

 
	Από τη μέθοδο addL1() και addL2() στο αρχείο, αυτές οι caches προστίθενται αν η λειτουργία είναι timing:
 ![εικόνα](https://github.com/user-attachments/assets/d89f778e-5bfc-42b3-a5e0-f2af3ab8478b)

	Τάση:
 ![εικόνα](https://github.com/user-attachments/assets/a55758e3-9b69-40e6-933d-725804289d1c)




Σύνοψη χαρακτηριστικών του συστήματος:
Χαρακτηριστικό	Τιμή/Τύπος
CPU	MinorCPU
Συχνότητα CPU	1GHz
Αριθμός πυρήνων	1 (προεπιλογή)
Cache	L1 Instruction Cache (L1I), L1 Data Cache (L1D), L2 Cache
Μέγεθος RAM	1GB
Τύπος μνήμης	DDR3_1600_8x8
Memory Channels	2
Ranks per Channel	None
Cache Line Size	64 bytes
Bus	SystemXBar
Τάση	3.3V



2) (a) Επαλήθευση από τα αρχεία config.ini και config.json
Στο config.ini:
	Αυτό δείχνει ότι ο επεξεργαστής που χρησιμοποιείται είναι το μοντέλο MinorCPU. ![εικόνα](https://github.com/user-attachments/assets/e47c6499-c1a6-425b-83e5-de76e0facc22)

 
	Αυτό σημαίνει ότι η συχνότητα λειτουργίας του επεξεργαστή έχει οριστεί σε 1GHz. ![εικόνα](https://github.com/user-attachments/assets/9bb5da2f-554d-4a66-80fc-5bd5f5a233de)

 
	Αυτές οι γραμμές δείχνουν ότι χρησιμοποιούνται L2 instruction cache (icache) και L2 data cache (dcache). ![εικόνα](https://github.com/user-attachments/assets/eb47cc6e-b4ea-4951-97bd-c873b2157d8c)

 
	Αυτό δείχνει ότι η μνήμη του συστήματος έχει οριστεί στα περίπου 214MB.
 ![εικόνα](https://github.com/user-attachments/assets/65ff452b-e920-4e1c-90aa-dae5db463399)

Στο config.json:
Αντίστοιχα σε αυτό το αρχείο βρήκαμε πάλι τα ίδια.


![εικόνα](https://github.com/user-attachments/assets/e31279b2-7d33-4fd6-a801-e68e2b88affe)
![εικόνα](https://github.com/user-attachments/assets/1598f35c-45e0-4bbf-84ea-4ab816d5c3e9)
![εικόνα](https://github.com/user-attachments/assets/475c20a3-7713-44a8-9252-4f84535ff9eb)
![εικόνα](https://github.com/user-attachments/assets/394a6982-b2df-441a-abe8-9f9b128bfe91)


(b) Τι είναι τα sim_seconds, sim_insts, και host_inst_rate:
	
 
 	sim_seconds:
	Είναι ο συνολικός χρόνος σε δευτερόλεπτα προσομοίωσης που πέρασε μέσα στο σύστημα που εξομοιώνεται.
	Αντιπροσωπεύει το χρόνο που μετράει το εξομοιωμένο σύστημα (όχι ο χρόνος στον πραγματικό υπολογιστή που εκτελεί την προσομοίωση).
 ![εικόνα](https://github.com/user-attachments/assets/7232c754-f24d-4e3a-9122-6dc655fa888a)


	sim_insts:
	Είναι ο συνολικός αριθμός των εντολών που εκτελέστηκαν (committed) κατά τη διάρκεια της εξομοίωσης.
	Αντιπροσωπεύει το πλήθος των εντολών που έχουν περάσει τη φάση commit στον pipeline της CPU.
 ![εικόνα](https://github.com/user-attachments/assets/14a682c3-f27e-44b2-9943-4b5b865f62a3)


	host_inst_rate:
	Είναι ο ρυθμός εκτέλεσης εντολών ανά δευτερόλεπτο στον υπολογιστή που φιλοξενεί τον εξομοιωτή (host machine).
	Δείχνει πόσο αποδοτικά εκτελείται η προσομοίωση στον πραγματικό υπολογιστή.
![εικόνα](https://github.com/user-attachments/assets/ff0091a6-2bf6-406b-bf5c-2849785180d5)
 

(c) Το συνολικό νούμερο των "committed" εντολών βρίσκεται στα στατιστικά (stats.txt) και είναι 5027.
![εικόνα](https://github.com/user-attachments/assets/18aa4221-4008-4321-b07b-3c72f3bf6410)
 
system.cpu_cluster.cpus.committedInsts           5027                       # Number of instructions committed
system.cpu_cluster.cpus.committedOps             5831                       # Number of ops (including micro ops) committed
  Η διαφορά προκύπτει επειδή τα στατιστικά που παράγονται από τον gem5 περιλαμβάνουν μόνο committed εντολές. Κάποιες εντολές μπορεί να έχουν αποτύχει ή να έχουν σταματήσει πριν το στάδιο commit (π.χ., λόγω branch misprediction). Επίσης, ο gem5 μπορεί να εκτελεί εσωτερικές εντολές (π.χ., λειτουργίες boot) που δεν καταγράφονται ως "committed" από τον χρήστη.

(d) Οι προσπελάσεις στην L2 cache βρίσκονται στο αρχείο stats.txt και είναι 474.
 ![εικόνα](https://github.com/user-attachments/assets/3286ff42-c042-450d-b3f2-710c019e728f)

system.cpu_cluster.l2.overall_accesses::total          474                       # number of overall (read+write) accesses
Μπορούμε να υπολογίσουμε τις προσπελάσεις στην L2 από τις προσπελάσεις της μνήμης και τις αποτυχίες (misses) στις L1 caches:
Προσπελάσεις L2 = Misses L1I + Misses L1D
Τα στατιστικά για τα L1 misses βρίσκονται στο stats.txt:
system.cpu_cluster.cpus.icache.overall_misses::total = Z1 system.cpu_cluster.cpus.dcache.overall_misses::total = Z2
Όπου Z1 και Z2 είναι τα misses στις L1 Instruction και Data Cache, αντίστοιχα.


3) Μοντέλα in-order CPUs στον gem5
Το site του gem5 παρέχει πληροφορίες για διαφορετικά μοντέλα επεξεργαστών, όπως τα in-order CPUs. Στον gem5, υπάρχουν βασικά δύο τύποι μοντέλων για in-order CPUs:
	MinorCPU:
	Το MinorCPU είναι ένα in-order CPU μοντέλο που σχεδιάστηκε για να είναι απλό και επεκτάσιμο.
	Διαθέτει μοντέλα για βασικές μονάδες, όπως fetch, decode, execute, και commit, που εκτελούνται σε σειρά (in-order).
	Προσομοιώνει τον χρόνο εκτέλεσης κάθε εντολής λεπτομερώς, γεγονός που το καθιστά χρήσιμο για εκπαιδευτικούς σκοπούς και ανάλυση υψηλού επιπέδου.
	TimingSimpleCPU:
	Το TimingSimpleCPU είναι ένα ακόμα in-order CPU μοντέλο, αλλά πιο απλό και πιο γρήγορο στην προσομοίωση συγκριτικά με το MinorCPU.
	Εστιάζει στη σωστή αλληλουχία των γεγονότων (timing) και προσφέρει ακριβείς χρονομετρήσεις για εντολές, αλλά δεν προσομοιώνει λεπτομερώς όλα τα στάδια του pipeline.
(a)  Για το ερώτημα αυτό δημιουργήσαμε ένα πρόγραμμα σε C το οποίο να υλοποιεί την ακολουθία Fibonacci και εκτελέστε το στον gem5 χρησιμοποιώντας διαφορετικά μοντέλα CPU και κρατώντας όλες τις άλλες παραμέτρους ίδιες. Χρησιμοποιήσαμε αρχικά MinorCPU και μετά TimingSimpleCPU. Ελέγξαμε το αρχείο stats.txt που παράγει ο gem5 για να βρείτε τον χρόνο εκτέλεσης (π.χ., sim_seconds) αντίστοιχα.
MinorCPU:

![εικόνα](https://github.com/user-attachments/assets/ae2ab81e-e050-4674-9167-6fe10adb91b3)
![εικόνα](https://github.com/user-attachments/assets/686455d7-a808-474c-88c1-4432e9b60c2f)
   
TimingSimpleCPU:

![εικόνα](https://github.com/user-attachments/assets/0b094005-8591-4939-91bd-3e0283bb9788)
![εικόνα](https://github.com/user-attachments/assets/957f6313-9419-4999-bae5-ff1247864d13)
  
(b)  Διαφορές και Επεξήγηση Αποτελεσμάτων
	MinorCPU: Προσομοιώνει πλήρως όλα τα στάδια του pipeline, επομένως η εκτέλεση είναι πιο αργή. Ο χρόνος εκτέλεσης (sim_seconds) αναμένεται να είναι μεγαλύτερος από το TimingSimpleCPU.
	TimingSimpleCPU: Λόγω της απλοποιημένης προσέγγισης (χωρίς πλήρη προσομοίωση του pipeline), η εκτέλεση είναι πιο γρήγορη.


C) Αλλαγή Παραμέτρων 
1. Αλλαγή Συχνότητας CPU

 
1GHz:

![εικόνα](https://github.com/user-attachments/assets/c6166b24-e89e-42c2-92dd-0e9433d1a350)
![εικόνα](https://github.com/user-attachments/assets/728bf5e0-d98c-461f-a2f2-f83803d4df1e)


  
20GHz:

![εικόνα](https://github.com/user-attachments/assets/23c689a3-985a-4d17-a0e7-74462fc87de4)
![εικόνα](https://github.com/user-attachments/assets/012a4f0d-7f72-459c-a97e-766454d504fe)


Παρατήρηση:


Με την αύξηση της συχνότητας από 1GHz σε 20GHz, παρατηρούμε μείωση του συνολικού χρόνου εκτέλεσης (sim_seconds), ωστόσο η αύξηση της συχνότητας δεν έχει πάντα γραμμική βελτίωση λόγω περιορισμών όπως η καθυστέρηση μνήμης.



2. Αλλαγή Τεχνολογίας Μνήμης


DDR4_2400_8X8:

![εικόνα](https://github.com/user-attachments/assets/2b95bc52-1633-4196-8116-2cfea4586b10)
![εικόνα](https://github.com/user-attachments/assets/2186fdcd-4b70-40dd-ba28-a37cb54672b1)
   


DDR3_1600_8x8:
   
![εικόνα](https://github.com/user-attachments/assets/528b3f12-7c89-4b60-b18e-abd039408a2e)
![εικόνα](https://github.com/user-attachments/assets/62e738b5-f6c6-4e34-b24d-ac7f5f24b501)



Παρατηρήση:


Η μετάβαση από DDR3_1600_8x8 σε DDR4_2400_8x8 αυξάνει τη διαμεταγωγή δεδομένων και μειώνει τις καθυστερήσεις πρόσβασης, γεγονός που μπορεί να μειώσει τον συνολικό χρόνο εκτέλεσης του προγράμματος. Ωστόσο, το μέγεθος της cache, η αρχιτεκτονική του επεξεργαστή και το πρότυπο πρόσβασης στη μνήμη μπορεί να επηρεάσουν το πραγματικό όφελος από την ταχύτερη μνήμη.









ΜΕΡΟΣ ΔΕΥΤΕΡΟ
Βήμα 1ο 
Στο δεύτερο μέρος της εργασίας ασχοληθήκαμε με την εκτέλεση των SPEC CPU2006 benchmarks στον gem5 είναι μια κοινή προσέγγιση για την ανάλυση της απόδοσης των συστημάτων. Τα SPEC benchmarks είναι σύνολα προγραμμάτων που σχεδιάστηκαν για να αξιολογούν την απόδοση των υπολογιστικών συστημάτων, και ειδικότερα των CPUs, μέσω πραγματικών workloads.

![εικόνα](https://github.com/user-attachments/assets/b3f07f0e-1e84-4869-a352-2019682f29c2)
![εικόνα](https://github.com/user-attachments/assets/8ab92ec1-bb51-45b6-86f7-36a606c6cdff)
![εικόνα](https://github.com/user-attachments/assets/fc0cc730-2e85-45fe-adee-fb28149b75a7)
![εικόνα](https://github.com/user-attachments/assets/aa91df20-789d-4f15-b44f-8b485a852766)
![εικόνα](https://github.com/user-attachments/assets/318b1f57-d3da-4abe-92fe-e7d034c245c5)
 
  
     

ΕΡΩΤΗΜΑΤΑ:
1)  Από το αρχείο config.ini βρίκαμε τις εξής πληροφορίες (και για τα 5 benchmrks βρήκαμε τα ίδια αποτελέσματα):

Μέγεθος Cache (size):
Το πεδίο size=32768 αντιπροσωπεύει το μέγεθος της L1 Instruction Cache (ICache).
Το πεδίο size= 65536 αντιπροσωπεύει το μέγεθος της L1 Data caches (DCache).
Το πεδίο size= 2097152 αντιπροσωπεύει το μέγεθος της L2 cache.
Associativity:
Το πεδίο assoc=2 αντιπροσωπεύει τον συσχετισμό (associativity) της L1 Instruction Cache.
Το πεδίο assoc=2 αντιπροσωπεύει τον συσχετισμό (associativity) της L1 Data caches.
Το πεδίο assoc=8 αντιπροσωπεύει τον συσχετισμό (associativity) της L2 cache.
Tο μέγεθος της cache line είναι 64.



 2) Από το αρχείο stats.txt βρήκαμε τα εξείς:



 	Στο specbzip


i) Χρόνος Εκτέλεσης (sim_seconds) = 0.045961

ii) CPI (Cycles Per Instruction):

Υπολογίζεται ως: CPI=(system.cpu.numCycles)/(system.cpu.committedInsts)= 1.8855

Όπου:

system.cpu.numCycles                         91921160

system.cpu.committedInsts                    48749217 

iii) Miss Rates:

system.cpu.icache.overall_miss_rate::total     0.000113

system.cpu.dcache.overall_miss_rate::total     0.005510 

system.l2.overall_miss_rate::total           0.936016


	Στο spechmmer
i) Χρόνος Εκτέλεσης (sim_seconds) = 0.059396

ii) CPI (Cycles Per Instruction):

Υπολογίζεται ως: CPI=(system.cpu.numCycles)/(system.cpu.committedInsts) =1.1879165

Όπου:
system.cpu.numCycles                         118791650

system.cpu.committedInsts                    100000000 

iii) Miss Rates:

system.cpu.icache.overall_miss_rate::total     0.000221

system.cpu.dcache.overall_miss_rate::total     0.001637

system.l2.overall_miss_rate::total           0.077760


	Στο speclibm

i) Χρόνος Εκτέλεσης (sim_seconds) = 0.174671

ii) CPI (Cycles Per Instruction):

Υπολογίζεται ως: CPI=(system.cpu.numCycles)/(system.cpu.committedInsts)=3.4934

Όπου:

system.cpu.numCycles                         349341455

system.cpu.committedInsts                    100000000 

iii) Miss Rates:


system.cpu.icache.overall_miss_rate::total     0.000094

system.cpu.dcache.overall_miss_rate::total     0.060972

system.l2.overall_miss_rate::total           0.999944



	Στο specmcf

i) Χρόνος Εκτέλεσης (sim_seconds) = 0.064955

ii) CPI (Cycles Per Instruction):

Υπολογίζεται ως: CPI=(system.cpu.numCycles)/(system.cpu.committedInsts)=1.2990

Όπου:

system.cpu.numCycles                         129909477

system.cpu.committedInsts                    100000001 

iii) Miss Rates:

system.cpu.icache.overall_miss_rate::total     0.023612


system.cpu.dcache.overall_miss_rate::total     0.002108

system.l2.overall_miss_rate::total           0.055046



	Στο specsjeng

i) Χρόνος Εκτέλεσης (sim_seconds) = 0.513528

ii) CPI (Cycles Per Instruction):

Υπολογίζεται ως: CPI=(system.cpu.numCycles)/(system.cpu.committedInsts)=10.2705

Όπου:

system.cpu.numCycles                         1027055373

system.cpu.committedInsts                    100000000 

iii) Miss Rates:

system.cpu.icache.overall_miss_rate::total     0.000020

system.cpu.dcache.overall_miss_rate::total     0.121831

system.l2.overall_miss_rate::total           0.000020




ΓΡΑΦΗΜΜΑΤΑ:

![εικόνα](https://github.com/user-attachments/assets/8ba17ca4-03c2-423f-8fc3-c1e4123c0a09)
![εικόνα](https://github.com/user-attachments/assets/271d07f9-b6ef-493c-a9c0-644530d0a65b)
![εικόνα](https://github.com/user-attachments/assets/603d1bc8-560a-4b20-b8ab-0687c7fa4cd1)
![εικόνα](https://github.com/user-attachments/assets/6b963fd7-701d-4ab3-b57d-a0270ae69571)
![εικόνα](https://github.com/user-attachments/assets/44a34135-4ee2-4242-8085-841e52151c98)
       

       

 
Από τα γραφήματα που παρουσιάζονται, μπορούμε να παρατηρήσουμε τα εξής:
i. Χρόνος Εκτέλεσης (Execution Time):
	Ο χρόνος εκτέλεσης αυξάνεται σταδιακά ανάλογα με το benchmark.
	Το jeng έχει τον μεγαλύτερο χρόνο εκτέλεσης, ενώ το bzip τον μικρότερο.
	Αυτό υποδεικνύει ότι το jeng απαιτεί σημαντικά περισσότερους πόρους.

ii. CPI (Cycles Per Instruction):
	Το CPI είναι πολύ υψηλό για το jeng, κάτι που συνάδει με τον αυξημένο χρόνο εκτέλεσης.
	Τα benchmarks hmmer και bzip έχουν χαμηλό CPI, δείχνοντας καλύτερη απόδοση.
	Η συσχέτιση μεταξύ CPI και χρόνου εκτέλεσης είναι εμφανής.

iii. Miss Rates - L1 Instruction Cache:
	Το mcf και το jeng παρουσιάζουν σχετικά υψηλά Miss Rates.
	Τα benchmarks bzip και hmmer έχουν σχεδόν μηδενικά Miss Rates, υποδεικνύοντας ότι η L1 Instruction Cache είναι πολύ αποδοτική σε αυτά.

iv. Miss Rates - L1 Data Cache:
	Το libquantum έχει τον υψηλότερο Miss Rate στη L1 Data Cache, γεγονός που υποδηλώνει συχνές αστοχίες.
	Τα υπόλοιπα benchmarks έχουν πολύ χαμηλά Miss Rates, κάτι που δείχνει αποδοτική χρήση της L1 Data Cache.

v. Miss Rates - L2 Cache:
	Το bzip και το libquantum έχουν εξαιρετικά υψηλά Miss Rates στην L2 Cache.
	Το hmmer έχει σχετικά χαμηλά Miss Rates, που ενδέχεται να συμβάλλουν στην καλύτερη απόδοσή του.

Συνολική Παρατήρηση:
	Το jeng είναι το benchmark με τη χαμηλότερη απόδοση λόγω υψηλού CPI και χρόνου εκτέλεσης.
	Τα bzip και hmmer δείχνουν βελτιστοποιημένη χρήση μνήμης με χαμηλά Miss Rates και CPI.
	Το υψηλό Miss Rate στην L2 Cache για το libquantum και το bzip πιθανώς επηρεάζει την απόδοσή τους αρνητικά.



3) Τρέξαμε ξανά τα benchmarks στον gem5 με τον ίδιο τρόπο με προηγουμένως αλλά αυτή τη φορά προσθέστε και την παράμετρο --cpu-clock=1GHz και --cpu-clock=3GHz.
				1GHz	2GHz (default)	3GHz
system.clk_domain.clock	1000	1000	1000
cpu_cluster.clk_domain.clock	1000	500		333

system.clk_domain.clock = 1000 MHz (1 GHz): Η συχνότητα του ρολογιού του συστήματος παραμένει σταθερή σε 1 GHz, ανεξαρτήτως της συχνότητας των CPU clusters. Αυτή η συχνότητα αφορά το γενικό χρονισμό του συστήματος, όπως τη μετάδοση δεδομένων μεταξύ μονάδων, μνήμης, κλπ.
cpu_cluster.clk_domain.clock:
	Στην περίπτωση του 1 GHz συστήματος, η συχνότητα του ρολογιού των CPU clusters είναι 1 GHz. Αυτό σημαίνει ότι οι CPU cores λειτουργούν με την ίδια συχνότητα με το γενικό σύστημα.
	Στην περίπτωση του 2 GHz συστήματος, η συχνότητα των CPU clusters είναι μειωμένη στο 500 MHz, δηλαδή οι CPU λειτουργούν με τη μισή συχνότητα σε σχέση με το σύστημα. Αυτό μπορεί να είναι αποτέλεσμα προσαρμογής της ενέργειας, για να μειώσουν την κατανάλωση και να διατηρήσουν τη σταθερότητα του συστήματος.
	Στην περίπτωση του 3 GHz συστήματος, η συχνότητα των CPU clusters μειώνεται περαιτέρω στα 333 MHz. Ο λόγος για αυτό μπορεί να είναι ακόμα πιο έντονη ρύθμιση εξοικονόμησης ενέργειας ή περιορισμοί απόδοσης που τίθενται από την αρχιτεκτονική του gem5 ή του υπολογιστικού συστήματος που προσομοιώνεται.
Αυτό που παρατηρείτε είναι μια στρατηγική dynamic voltage and frequency scaling (DVFS), η οποία χρησιμοποιείται για να ελέγξει την κατανάλωση ενέργειας και τη θερμοκρασία, ενώ παράλληλα προσπαθεί να διατηρήσει την απόδοση του συστήματος. Όταν η συχνότητα του ρολογιού του συστήματος (system clock) αυξάνεται, μπορεί να υπάρχει η ανάγκη για μείωση της συχνότητας των CPU cores, καθώς οι υψηλότερες συχνότητες CPU συνήθως απαιτούν υψηλότερη κατανάλωση ενέργειας και μπορεί να προκαλέσουν μεγαλύτερη θερμότητα.
Το τέλειο scaling συμβαίνει όταν η απόδοση του συστήματος αυξάνεται γραμμικά με την αύξηση της συχνότητας ή του αριθμού των επεξεργαστών. Ωστόσο, στην πράξη, δεν έχουμε πάντα τέλειο scaling. Μερικοί λόγοι για την απουσία τέλειου scaling είναι:
	Περιορισμοί στο υποσύστημα μνήμης:
	Ενώ οι επεξεργαστές μπορεί να λειτουργούν με υψηλότερες συχνότητες, το υποσύστημα μνήμης (π.χ., L1, L2 caches, DRAM) μπορεί να μην είναι σε θέση να υποστηρίξει την αυξημένη ζήτηση, προκαλώντας bottlenecks και καθυστερήσεις.
	Κυρίως οι μηχανισμοί συγχρονισμού:
	Καθώς προστίθενται περισσότερες μονάδες επεξεργασίας, η επικοινωνία μεταξύ των επεξεργαστών (π.χ., μέσω του δικτύου) μπορεί να προκαλέσει καθυστερήσεις που επηρεάζουν τη συνολική απόδοση.
	Ενεργειακή κατανάλωση και θερμότητα:
	Η αύξηση του αριθμού των επεξεργαστών και η αύξηση της συχνότητας μπορεί να δημιουργήσει θερμικά προβλήματα ή υπερβολική κατανάλωση ενέργειας, αναγκάζοντας το σύστημα να μειώσει τη συχνότητα ή να εισάγει περιορισμούς.
	Ανεπαρκής παράλληλη εκτέλεση:
	Ορισμένα benchmarks δεν επωφελούνται πλήρως από τη προσθήκη περισσότερων επεξεργαστών, λόγω περιορισμένων παραλληλίας ή λόγω αρνητικού scaling (δηλαδή, τα κέρδη από τη χρήση πολλών επεξεργαστών μειώνονται ή είναι μηδενικά).


4) Στο ερώτημα αυτό κάναμε αλλαγή στο memory configuration από DDR3_1600_x64 στο DDR3_2133_x64 (DDR3 με πιο γρήγορο clock ).
Αρχικά (DDR3_1600_x64):
system.cpu.cpi                               1.679650
sim_seconds                                  0.083982
system.cpu.icache.overall_miss_rate::total     0.000113
system.cpu.dcache.overall_miss_rate::total     0.005510 
system.l2.overall_miss_rate::total           0.936016

μετά (DDR3_2133_x64): 
system.cpu.cpi                               1.672175
sim_seconds                                  0.083609
system.cpu.icache.overall_miss_rate::total     0.000077
system.cpu.dcache.overall_miss_rate::total     0.014795 
system.l2.overall_miss_rate::total           0.282159

Παρατηρήσεις και εξήγηση:
	Βελτίωση στην απόδοση της μνήμης: Με το DDR3_2133_x64, το σύστημα έχει καλύτερη απόδοση στην ανάκτηση δεδομένων από την cache και γενικά πιο γρήγορη απόδοση στις εντολές, όπως φαίνεται από το μικρότερο CPI και την μείωση του miss rate στη L2 cache.
	Αύξηση του miss rate στην L1 data cache: Αν και το σύστημα είναι γενικά πιο γρήγορο με την ταχύτερη μνήμη, η αυξημένη ταχύτητα μνήμης μπορεί να προκαλεί πίεση στην L1 data cache, οδηγώντας σε περισσότερα misses για τα δεδομένα. Η αύξηση αυτή πιθανώς οφείλεται στην αυξημένη ροή δεδομένων που απαιτούν περισσότερους κύκλους ανανέωσης ή στη λιγότερη δυνατότητα του συστήματος να προβλέψει τις απαιτήσεις δεδομένων.
Γενικό Συμπέρασμα:
Η αλλαγή στη μνήμη από DDR3_1600 σε DDR3_2133 έχει μια μικρή αλλά θετική επίδραση στην απόδοση, ιδιαίτερα στην L2 cache. Ωστόσο, η αλλαγή δεν έχει σημαντικό αντίκτυπο στους χρόνους προσομοίωσης ή το CPI, κάτι που μπορεί να υποδηλώνει ότι η απόδοση του συστήματος περιορίζεται από άλλους παράγοντες (π.χ., η CPU, οι caches, η παραλληλία).





Βήμα 2ο 
Εύρεση Βέλτιστων Τιμών Παραμέτρων
Το υποσύστημα μνήμης επηρεάζει άμεσα την απόδοση του επεξεργαστή. CPI μεγαλύτερο από 1 υποδεικνύει καθυστερήσεις λόγω αστοχιών (misses) στις μνήμες cache. Για τη μεγιστοποίηση της απόδοσης, εξετάζονται οι παρακάτω παράμετροι:
- L1 instruction cache size
- L1 instruction cache associativity
- L1 data cache size
- L1 data cache associativity
- L2 cache size
- L2 cache associativity
- Μέγεθος cache line

ΕΡΩΤΗΜΑΤΑ:

Ανάλυση Αποτελεσμάτων για το bzip
Χρόνος Εκτέλεσης (sim_seconds = 0.045961):
Ο χρόνος εκτέλεσης είναι πολύ χαμηλός, γεγονός που υποδεικνύει ότι το σύστημα διαχειρίζεται αποτελεσματικά την εκτέλεση του προγράμματος.
CPI (1.8855):
Το CPI είναι υψηλότερο από το βέλτιστο (1.0), κάτι που δείχνει ότι ο επεξεργαστής καθυστερεί λόγω περιορισμών στην προσπέλαση της μνήμης. Ειδικά, το υψηλό miss rate της L2 Cache επηρεάζει την απόδοση.
Miss Rates:
	Instruction Cache Miss Rate: 0.000113 (Πολύ καλό, δεν απαιτεί αλλαγές).
	Data Cache Miss Rate: 0.005510 (Αποδεκτό, αλλά μπορεί να βελτιωθεί).
	L2 Cache Miss Rate: 0.936016 (Εξαιρετικά υψηλό, απαιτεί άμεση βελτίωση).
	
Προτεινόμενες Αλλαγές Παραμέτρων

L1 Instruction Cache Sizes (l1_icache_sizes):
Η L1 Instruction Cache έχει εξαιρετικό miss rate, επομένως δεν απαιτεί αλλαγή.
	Προτεινόμενη Τιμή: 32kB.

L1 Data Cache Sizes (l1_dcache_sizes):
Η L1 Data Cache παρουσιάζει αποδεκτό miss rate, αλλά μπορεί να δοκιμαστεί μεγαλύτερο μέγεθος για μικρή περαιτέρω βελτίωση.
	Προτεινόμενες Τιμές: 32kB, 64kB.

L2 Cache Sizes (l2_cache_sizes):
Η L2 Cache έχει εξαιρετικά υψηλό miss rate. Η αύξηση του μεγέθους της είναι κρίσιμη για τη μείωση των misses.
	Προτεινόμενες Τιμές: 4MB, 8MB.

 
Associativities:

	L1 Instruction Cache Associativity (l1_icache_associativities):
Το associativity μπορεί να παραμείνει σταθερό, καθώς η L1 Instruction Cache λειτουργεί αποτελεσματικά.
	Προτεινόμενη Τιμή: 2/4.
	
 L1 Data Cache Associativity (l1_dcache_associativities):
Η L1 Data Cache μπορεί να διατηρηθεί ως έχει, αλλά μεγαλύτερο associativity μπορεί να μειώσει περαιτέρω τα conflict misses.
	Προτεινόμενη Τιμή: 4/8.
	
 L2 Cache Associativity (l2_cache_associativities):
Η αύξηση του associativity μπορεί να μειώσει το πολύ υψηλό miss rate της L2 Cache.
	Προτεινόμενη Τιμή: 8.

Cache Line Sizes (cache_line_sizes):
Η αύξηση του cache line size μπορεί να είναι αποδοτική για το συγκεκριμένο benchmark, καθώς συχνά διαχειρίζεται μεγάλες ποσότητες σειριακών δεδομένων.
	Προτεινόμενες Τιμές: 64 bytes, 128 bytes.


 ![εικόνα](https://github.com/user-attachments/assets/45ea190d-f06b-46cb-9851-a510654ff70c)
![εικόνα](https://github.com/user-attachments/assets/39eabb3f-4880-4fea-99b2-5511cc43d2d0)
![εικόνα](https://github.com/user-attachments/assets/c515c594-0ab5-4957-acb7-44330d73e95a)
![εικόνα](https://github.com/user-attachments/assets/9710d881-1250-4964-baee-73730bcf8650)

 
 
 
Ανάλυση Αποτελεσμάτων για το mcf

Χρόνος Εκτέλεσης (sim_seconds = 0.064955):

Ο χρόνος εκτέλεσης είναι σχετικά μικρός, αλλά το σύστημα μπορεί να επωφεληθεί από βελτιώσεις στην απόδοση, κυρίως λόγω των miss rates και του CPI που παρατηρούνται.
CPI (1.2990):
Το CPI είναι υψηλότερο από το ιδανικό (1.0), κάτι που υποδεικνύει ότι το σύστημα υποφέρει από καθυστερήσεις στην προσπέλαση μνήμης και άλλους περιορισμούς στην εκτέλεση. Παρά το γεγονός ότι το CPI δεν είναι υπερβολικά υψηλό, υπάρχουν περιθώρια βελτίωσης στην αρχιτεκτονική της μνήμης για καλύτερη απόδοση.
Υπολογισμός CPI: CPI = (system.cpu.numCycles) / (system.cpu.committedInsts) = 1.2990
Όπου:
	system.cpu.numCycles = 129909477
	system.cpu.committedInsts = 100000001

Miss Rates:
	Instruction Cache Miss Rate (icache): 0.023612 (Αποδεκτό, αλλά μπορεί να βελτιωθεί).
	Data Cache Miss Rate (dcache): 0.002108 (Πολύ καλό, δεν απαιτεί άμεση αλλαγή).
	L2 Cache Miss Rate: 0.055046 (Υψηλό, απαιτεί βελτίωση).

Προτεινόμενες Αλλαγές Παραμέτρων:
	L1 Instruction Cache Sizes (l1_icache_sizes):

Η L1 Instruction Cache έχει κάποιο miss rate που μπορεί να μειωθεί με την αύξηση του μεγέθους της. Η αύξηση του μεγέθους μπορεί να μειώσει τα misses στην Instruction Cache, καθώς το σύστημα πιθανόν να έχει μεγαλύτερες ανάγκες μνήμης για τις εντολές.
	Προτεινόμενες Τιμές: 32kB, 64kB.

 L1 Data Cache Sizes (l1_dcache_sizes):
Η L1 Data Cache έχει πολύ καλό miss rate, αλλά η αύξηση του μεγέθους της μπορεί να βοηθήσει περαιτέρω στη μείωση των misses, ιδιαίτερα όταν οι εφαρμογές εκτελούν μεγάλες εργασίες δεδομένων.
	Προτεινόμενες Τιμές: 64kB, 128kB.
	L2 Cache Sizes (l2_cache_sizes):

Η L2 Cache έχει αρκετά υψηλό miss rate, γεγονός που επηρεάζει την απόδοση. Η αύξηση του μεγέθους της L2 Cache μπορεί να βοηθήσει στη μείωση των misses και στην καλύτερη διαχείριση μεγάλων δεδομένων.
	Προτεινόμενη Τιμή: 4MB.

 L1 Instruction Cache Associativity (l1_icache_associativities):
Η L1 Instruction Cache μπορεί να επωφεληθεί από αύξηση του associativity για την καλύτερη διαχείριση των δεδομένων και τη μείωση των misses. Μία μικρή αύξηση του associativity μπορεί να βελτιώσει την απόδοση χωρίς να προκαλέσει υπερβολικές καθυστερήσεις.
	Προτεινόμενες Τιμές: 2, 4.

 L1 Data Cache Associativity (l1_dcache_associativities):
Η L1 Data Cache μπορεί να έχει χαμηλότερο associativity, αλλά η αύξησή του μπορεί να μειώσει τα conflict misses και να βελτιώσει τη συνολική απόδοση, ειδικά σε workloads με μεγαλύτερη ανάγκη πρόσβασης στη μνήμη.
	Προτεινόμενες Τιμές: 4, 8.

 L2 Cache Associativity (l2_cache_associativities):
Η L2 Cache έχει σημαντικό miss rate, και η αύξηση του associativity μπορεί να μειώσει το miss rate και να ενισχύσει την απόδοση της Cache. Αν και το 8-way associativity μπορεί να οδηγήσει σε μικρότερη καθυστέρηση για τις αναγνώσεις, βοηθά στην αποδοτικότερη διαχείριση των δεδομένων.
	Προτεινόμενη Τιμή: 8.

 Cache Line Sizes (cache_line_sizes):
Η αύξηση του cache line size μπορεί να είναι αποδοτική για την εκτέλεση συγκεκριμένων benchmarks, ιδίως όταν οι δεδομένα που επεξεργάζονται είναι μεγάλα και συνεχόμενα. Η αύξηση του cache line μπορεί να μειώσει τα misses και να βελτιώσει την απόδοση.
	Προτεινόμενες Τιμές: 32 bytes, 64 bytes.


Συνοπτικά:
Οι αλλαγές που προτείνονται έχουν στόχο την ενίσχυση της απόδοσης του συστήματος, κυρίως μέσω της βελτίωσης της διαχείρισης της μνήμης. Οι μεγάλες caches (L1 και L2) με υψηλότερο associativity θα βοηθήσουν στη μείωση των misses και στη βελτίωση της εκτέλεσης, ενώ η αύξηση του cache line size θα βοηθήσει στην καλύτερη διαχείριση των δεδομένων που είναι κοντά μεταξύ τους στον χώρο μνήμης.


  ![εικόνα](https://github.com/user-attachments/assets/9a96fd1f-6947-4d93-9ebe-3c5ae6a589ea)
![εικόνα](https://github.com/user-attachments/assets/49a05183-c9ee-4a22-a769-df154d0ee9f8)
![εικόνα](https://github.com/user-attachments/assets/d66c9230-5362-4074-a22b-30f120f33dce)
![εικόνα](https://github.com/user-attachments/assets/c4d7295d-b151-4e0f-9fd9-678f95beab99)

 
 
Ανάλυση Αποτελεσμάτων για το hmmer

Χρόνος Εκτέλεσης (sim_seconds = 0.059396):
Ο χρόνος εκτέλεσης είναι σχετικά μικρός, δείχνοντας ότι το σύστημα διαχειρίζεται καλά τη φόρτιση εργασίας. Ωστόσο, η απόδοση μπορεί να βελτιωθεί περαιτέρω, όπως υποδεικνύεται από το CPI και τα miss rates.

CPI (1.1879165):
Το CPI είναι κοντά στο βέλτιστο και υποδεικνύει ότι ο επεξεργαστής εκτελεί τις εντολές με αποδοτικότητα. Ωστόσο, το CPI δεν είναι 1.0, γεγονός που δείχνει ότι υπάρχουν κάποια περιθώρια βελτίωσης, πιθανώς λόγω καθυστερήσεων στην προσπέλαση μνήμης ή άλλων περιορισμών στο σύστημα.

Υπολογισμός CPI: CPI = (system.cpu.numCycles) / (system.cpu.committedInsts) = 1.1879165

Όπου:
	system.cpu.numCycles = 118791650
	system.cpu.committedInsts = 100000000

Miss Rates:
	Instruction Cache Miss Rate (icache): 0.000221 (Πολύ καλό, δεν απαιτεί αλλαγές).
	Data Cache Miss Rate (dcache): 0.001637 (Αποδεκτό, μπορεί να βελτιωθεί).
	L2 Cache Miss Rate: 0.077760 (Πολύ υψηλό, απαιτεί βελτίωση).

Προτεινόμενες Αλλαγές Παραμέτρων:
	L1 Instruction Cache Sizes (l1_icache_sizes):

Η L1 Instruction Cache έχει καλό miss rate και δεν απαιτεί άμεση αλλαγή. Ωστόσο, δεν υπάρχουν μεγάλα περιθώρια για βελτίωση εδώ.
	Προτεινόμενη Τιμή: 32kB.

 L1 Data Cache Sizes (l1_dcache_sizes):
Η L1 Data Cache παρουσιάζει αποδεκτό miss rate, αλλά η αύξηση του μεγέθους μπορεί να μειώσει το miss rate και να βελτιώσει την απόδοση.
	Προτεινόμενες Τιμές: 32kB, 64kB.

 L2 Cache Sizes (l2_cache_sizes):
Η L2 Cache έχει πολύ υψηλό miss rate, γεγονός που δείχνει ότι είναι ο βασικός περιοριστικός παράγοντας στην απόδοση του συστήματος. Η αύξηση του μεγέθους της L2 Cache είναι κρίσιμη για τη βελτίωση της απόδοσης.
	Προτεινόμενη Τιμή: 4MB.

 L1 Instruction Cache Associativity (l1_icache_associativities):
Η L1 Instruction Cache λειτουργεί καλά με το υπάρχον associativity, όμως αν η απόδοση δεν είναι ικανοποιητική, η αύξηση του associativity μπορεί να μειώσει τα cache misses.
	Προτεινόμενες Τιμές: 2, 4.

 L1 Data Cache Associativity (l1_dcache_associativities):
Η L1 Data Cache μπορεί να ωφεληθεί από αύξηση του associativity, μειώνοντας τα conflict misses και ενισχύοντας την απόδοση.
	Προτεινόμενες Τιμές: 2, 4, 8.

 L2 Cache Associativity (l2_cache_associativities):
Η αύξηση του associativity στην L2 Cache μπορεί να μειώσει τα misses και να βελτιώσει την απόδοση, δεδομένου του υψηλού miss rate της.
	Προτεινόμενη Τιμή: 8.

 Cache Line Sizes (cache_line_sizes):
Η αύξηση του cache line size μπορεί να είναι επωφελής για συγκεκριμένα benchmarks που απαιτούν μεγάλες μεταφορές δεδομένων και μεγάλα μπλοκ μνήμης. Στην περίπτωση αυτή, η αύξηση του cache line size μπορεί να βοηθήσει στην μείωση των misses και στη βελτίωση της απόδοσης.
	Προτεινόμενες Τιμές: 64 bytes, 128 bytes.


Αυτές οι προτεινόμενες αλλαγές μπορούν να βοηθήσουν στη βελτίωση της απόδοσης του συστήματος για το spechmmer benchmark, μειώνοντας το miss rate της L2 Cache και αυξάνοντας την αποδοτικότητα του συστήματος στη διαχείριση της μνήμης.
 
 
 ![εικόνα](https://github.com/user-attachments/assets/9348ae4a-ad0a-4cea-861e-6e84e4184e16)
![εικόνα](https://github.com/user-attachments/assets/eab8a1d3-bbd7-41fc-a172-cbef49a73f25)
![εικόνα](https://github.com/user-attachments/assets/dbeb111c-80d3-4cfd-8270-3aebf9a0bcea)
![εικόνα](https://github.com/user-attachments/assets/0d5ee987-04d6-40be-a1b0-c23f027777ad)

 
 

 
Ανάλυση Αποτελεσμάτων για το jeng

Χρόνος Εκτέλεσης (sim_seconds = 0.513528):
Ο χρόνος εκτέλεσης είναι ικανοποιητικός, όμως υπάρχουν περιθώρια βελτίωσης, κυρίως λόγω του υψηλού CPI που παρατηρείται.

CPI (10.2705):
Το CPI είναι αρκετά υψηλό, πράγμα που υποδεικνύει ότι ο επεξεργαστής δεν εκτελεί εντολές όσο αποτελεσματικά θα μπορούσε. Αυτός ο υψηλός δείκτης πιθανόν να προέρχεται από καθυστερήσεις στην προσπέλαση της μνήμης, καθώς και από άλλα παραμέτρους του συστήματος που περιορίζουν την αποδοτικότητα της εκτέλεσης.

Υπολογισμός CPI: CPI = (system.cpu.numCycles) / (system.cpu.committedInsts) = 10.2705

Όπου:
	system.cpu.numCycles = 1027055373
	system.cpu.committedInsts = 100000000

Miss Rates:
	Instruction Cache Miss Rate (icache): 0.000020 (Πολύ καλό, δεν απαιτεί αλλαγές).
	Data Cache Miss Rate (dcache): 0.121831 (Αποδεκτό, αλλά μπορεί να βελτιωθεί).
	L2 Cache Miss Rate: 0.000020 (Πολύ καλό, δεν απαιτεί αλλαγές).

Προτεινόμενες Αλλαγές Παραμέτρων:
	L1 Instruction Cache Sizes (l1_icache_sizes): Η L1 Instruction Cache έχει πολύ καλό miss rate, επομένως δεν απαιτεί αλλαγή.
	Προτεινόμενη Τιμή: 32kB.

 L1 Data Cache Sizes (l1_dcache_sizes): Η L1 Data Cache έχει αποδεκτό miss rate, και μπορεί να γίνει πείραμα με μεγαλύτερο μέγεθος για βελτίωση.
	Προτεινόμενες Τιμές: 64kB, 128kB.
	
 L2 Cache Sizes (l2_cache_sizes): Η L2 Cache έχει πολύ καλό miss rate και δεν απαιτεί αλλαγή. Ωστόσο, αν η απόδοση δεν είναι ικανοποιητική, η αύξηση του μεγέθους μπορεί να εξεταστεί.
	Προτεινόμενη Τιμή: 4MB.

 L1 Instruction Cache Associativity (l1_icache_associativities): Το associativity της L1 Instruction Cache φαίνεται να είναι αρκετό, όμως μπορεί να αυξηθεί για καλύτερη απόδοση σε πιο απαιτητικά workloads.
	Προτεινόμενη Τιμή: 4.

 L1 Data Cache Associativity (l1_dcache_associativities): Η L1 Data Cache μπορεί να βελτιωθεί με υψηλότερο associativity, μειώνοντας τα conflict misses και ενισχύοντας την απόδοση.
	Προτεινόμενες Τιμές: 4, 8.
	
 L2 Cache Associativity (l2_cache_associativities): Η αύξηση του associativity στην L2 Cache μπορεί να μειώσει τα misses και να βελτιώσει την απόδοση του συστήματος.
	Προτεινόμενη Τιμή: 8.
	
 Cache Line Sizes (cache_line_sizes): Η αύξηση του cache line size μπορεί να είναι αποδοτική για τα συγκεκριμένα benchmarks, καθώς μπορεί να μειώσει τις καθυστερήσεις σε συχνές προσβάσεις στην μνήμη.
	Προτεινόμενες Τιμές: 64 bytes, 128 bytes.


  ![εικόνα](https://github.com/user-attachments/assets/ff2e34ea-ac1e-4e53-9a9b-918a45597971)
![εικόνα](https://github.com/user-attachments/assets/88294a7a-03c8-4082-8bf6-aa27bdd6264f)
![εικόνα](https://github.com/user-attachments/assets/8640eb43-d459-40c3-9eb9-5aa5b6d98ea6)
![εικόνα](https://github.com/user-attachments/assets/4d1a1c98-108b-42fd-a548-e15a9e15ced4)





  
Ανάλυση Αποτελεσμάτων για το libm

Χρόνος Εκτέλεσης (sim_seconds = 0.174671):

Ο χρόνος εκτέλεσης είναι σχετικά υψηλός, κάτι που υποδεικνύει ότι το σύστημα ενδέχεται να επηρεάζεται από καθυστερήσεις που σχετίζονται με την προσπέλαση στη μνήμη. Ο χρόνος εκτέλεσης μπορεί να μειωθεί με βελτιώσεις στη διαχείριση της μνήμης και τη βελτίωση των miss rates.

CPI (3.4934):
Το CPI είναι εξαιρετικά υψηλό, γεγονός που υποδεικνύει ότι ο επεξεργαστής εκτελεί τις εντολές με αργό ρυθμό λόγω καθυστερήσεων στην προσπέλαση της μνήμης. Ο υψηλός CPI συνήθως υποδηλώνει ότι το σύστημα χρειάζεται περισσότερο χρόνο για να επεξεργαστεί κάθε εντολή, κάτι που σχετίζεται με τα υψηλά miss rates στην Cache.

Υπολογισμός CPI: CPI = (system.cpu.numCycles) / (system.cpu.committedInsts) = 3.4934

Όπου:
	system.cpu.numCycles = 349341455
	system.cpu.committedInsts = 100000000

Miss Rates:
	Instruction Cache Miss Rate (icache): 0.000094 (Πολύ καλό, δεν απαιτεί αλλαγές).
	Data Cache Miss Rate (dcache): 0.060972 (Υψηλό, χρειάζεται βελτίωση).
	L2 Cache Miss Rate: 0.999944 (Πολύ υψηλό, απαιτεί άμεση βελτίωση).

Προτεινόμενες Αλλαγές Παραμέτρων:
	L1 Instruction Cache Sizes (l1_icache_sizes):

Η L1 Instruction Cache έχει εξαιρετικά καλό miss rate, επομένως δεν απαιτεί αλλαγή.
	Προτεινόμενη Τιμή: 32kB.
	
 L1 Data Cache Sizes (l1_dcache_sizes):
Η L1 Data Cache έχει αρκετά υψηλό miss rate και η αύξηση του μεγέθους της μπορεί να μειώσει σημαντικά τα misses και να βελτιώσει την απόδοση του συστήματος.
	Προτεινόμενες Τιμές: 64kB, 128kB.
	
 L2 Cache Sizes (l2_cache_sizes):
Η L2 Cache έχει εξαιρετικά υψηλό miss rate, κάτι που οδηγεί σε σημαντικές καθυστερήσεις και επηρεάζει αρνητικά την απόδοση του συστήματος. Η αύξηση του μεγέθους της L2 Cache είναι κρίσιμη για τη μείωση των misses και τη βελτίωση της συνολικής απόδοσης.
	Προτεινόμενη Τιμή: 4MB.

 L1 Instruction Cache Associativity (l1_icache_associativities):
Η L1 Instruction Cache μπορεί να παραμείνει ως έχει, δεδομένου ότι το miss rate είναι ήδη πολύ χαμηλό. Ωστόσο, αν η απόδοση του συστήματος δεν είναι ικανοποιητική, η αύξηση του associativity μπορεί να προσφέρει επιπλέον βελτίωση.
	Προτεινόμενες Τιμές: 2, 4.

 L1 Data Cache Associativity (l1_dcache_associativities):
Η L1 Data Cache εμφανίζει υψηλό miss rate και η αύξηση του associativity μπορεί να μειώσει τα conflict misses και να βελτιώσει την απόδοση.
	Προτεινόμενες Τιμές: 4, 8.

 L2 Cache Associativity (l2_cache_associativities):
Η L2 Cache εμφανίζει εξαιρετικά υψηλό miss rate, και η αύξηση του associativity είναι κρίσιμη για τη μείωση των misses και την ενίσχυση της απόδοσης της Cache.
	Προτεινόμενη Τιμή: 8.
	
 Cache Line Sizes (cache_line_sizes):
Η αύξηση του cache line size μπορεί να βελτιώσει την απόδοση, καθώς η επεξεργασία μεγάλων δεδομένων σε μεγαλύτερες γραμμές μνήμης μπορεί να μειώσει τα misses. Σε περιπτώσεις όπως αυτή, με μεγάλες ανάγκες για μεταφορές δεδομένων, η αύξηση του cache line size μπορεί να προσφέρει σημαντική βελτίωση.
	Προτεινόμενες Τιμές: 64 bytes, 128 bytes.


Συνοπτικά:
Το σύστημα υποφέρει από πολύ υψηλά miss rates στην L2 Cache, τα οποία επηρεάζουν σημαντικά την απόδοση και οδηγούν σε υψηλό CPI. Η αύξηση του μεγέθους των L1 και L2 Caches, μαζί με την αύξηση του associativity και του cache line size, θα βοηθήσει στη μείωση των misses και στην καλύτερη διαχείριση της μνήμης, προσφέροντας καλύτερη συνολική απόδοση.
  

  ![εικόνα](https://github.com/user-attachments/assets/b2a109c8-b731-4778-af68-d2b67447aa9c)
![εικόνα](https://github.com/user-attachments/assets/202eaffe-a003-4c56-b54d-a845f8767333)
![εικόνα](https://github.com/user-attachments/assets/b477e029-2546-49a5-8723-5252feb9cd13)
![εικόνα](https://github.com/user-attachments/assets/c356ba1b-033c-4199-83c6-38d17dfcadbf)






Βήμα 3ο 

Θεωρούμε ότι Ccore=[Ccache+Cassociativity+Cline_size]*CPI

Δηλαδή, το Ccore   είναι


[C1⋅(SL1_I*103+SL1_D*103)+C2⋅SL2*106+C3⋅(AL1_I+AL1_D)+ C4⋅AL2+C5⋅line size]⋅CPI


Όπου:

•	Συντελεστές C1, C2, C3, C4, C5 εκφράζουν το κόστος ανά μονάδα μεγέθους και πολυπλοκότητας.
•	S = Μέγεθος cache 
•	A = Associativity

Από την έρευνα που κάναμε προκύπτει ότι :


Ccore=[0.05*(SL1_I*103+SL1_D*103)+0.02*SL2*106+0.1*(AL1_I+AL1_D)+0.05*AL2+0.005⋅line size]⋅CPI


Ανάλυση των παραγόντων κόστους
Η συνάρτηση λαμβάνει υπόψη πολλούς κρίσιμους παράγοντες που επηρεάζουν το κόστος ενός πυρήνα επεξεργαστή:
1.	Μέγεθος Cache (SL1_I, SL1_D, SL2)
o	Οι L1 caches (Instruction & Data) έχουν μεγαλύτερο συντελεστή κόστους (0.05) λόγω της υψηλής ταχύτητας και της πολυπλοκότητας τους.
o	Η L2 cache έχει μικρότερο συντελεστή (0.02), γεγονός που αντικατοπτρίζει το χαμηλότερο κόστος ανά MB.
o	Η αύξηση του μεγέθους αυξάνει σημαντικά το συνολικό κόστος, ειδικά για την L1.
Συμπέρασμα:
•	Μικρές L1 caches είναι ακριβότερες ανά KB, αλλά προσφέρουν καλύτερη απόδοση.
•	Η L2 cache είναι φθηνότερη ανά μονάδα χωρητικότητας, αλλά μεγαλύτερο μέγεθος μπορεί να αυξήσει το latency.

2.	Associativity (AL1_I, AL1_D, AL2)
o	Το associativity των L1 caches έχει σημαντικό αντίκτυπο στο κόστος (0.1), καθώς αυξάνει την πολυπλοκότητα του hardware.
o	Η L2 cache έχει χαμηλότερο συντελεστή κόστους (0.05), καθώς το associativity επηρεάζει λιγότερο την απόδοση λόγω του μεγαλύτερου μεγέθους.
Συμπέρασμα:
•	Υψηλότερο associativity βελτιώνει τη hit rate αλλά αυξάνει το κόστος λόγω πολύπλοκης δρομολόγησης.
•	Ισορροπημένο associativity (π.χ. 4-8 way) μπορεί να προσφέρει καλή σχέση κόστους/απόδοσης.

3.	Μέγεθος Cache Line (line size)
o	Το κόστος της cache line έχει πολύ μικρή επίδραση (0.005), υποδηλώνοντας ότι το κύριο κόστος προέρχεται από το συνολικό μέγεθος της cache και το associativity.
o	Μεγαλύτερα cache lines μειώνουν τα misses αλλά αυξάνουν την κατανάλωση ενέργειας και την πολυπλοκότητα της διαχείρισης μνήμης.
Συμπέρασμα:
•	Η επιλογή του σωστού μεγέθους cache line (π.χ. 64B) είναι κρίσιμη για την απόδοση χωρίς υπερβολικό κόστος.

4.	CPI (Cycles Per Instruction)
o	Το κόστος κλιμακώνεται με το CPI, κάτι που δείχνει τη σημασία της απόδοσης στον τελικό σχεδιασμό.
o	Ένα υψηλό CPI υποδεικνύει ότι οι επενδύσεις στη μνήμη cache δεν έχουν αποδώσει αρκετά σε απόδοση.
o	Η μείωση του CPI με σωστές αρχιτεκτονικές επιλογές μπορεί να δικαιολογήσει υψηλότερα κόστη hardware.
Συμπέρασμα:
•	Χαμηλότερο CPI σημαίνει καλύτερη απόδοση και μειώνει το κόστος ανά μονάδα απόδοσης.
•	Βελτιστοποίηση των cache παραμέτρων μπορεί να μειώσει το CPI και να βελτιώσει το κόστος/απόδοση.

Γενικά Συμπεράσματα και Στρατηγικές Βελτιστοποίησης
1.	Ισορροπία μεταξύ κόστους και απόδοσης:
o	Αυξημένα μεγέθη cache και υψηλό associativity μειώνουν το CPI, αλλά αυξάνουν το κόστος.
o	Μια ισορροπημένη αρχιτεκτονική πρέπει να στοχεύει σε αποδεκτό CPI με το μικρότερο δυνατό κόστος.
2.	Βασικές στρατηγικές επιλογές:
o	Χρήση 32-64 KB L1 caches με 8-way associativity για αποδεκτό κόστος και υψηλή hit rate.
o	L2 cache γύρω στο 256 KB - 1 MB, με μέτριο associativity (4-way) για καλό trade-off μεταξύ ταχύτητας και κόστους.
o	Cache line size στα 64B, εκτός αν απαιτείται υψηλότερο bandwidth.
3.	Κόστος ανάλογα με την εφαρμογή:
o	Εφαρμογές υψηλής απόδοσης (gaming, scientific computing) δικαιολογούν μεγαλύτερο κόστος με στόχο χαμηλό CPI.
o	Εφαρμογές χαμηλής κατανάλωσης (mobile, embedded) απαιτούν αυστηρό έλεγχο του κόστους.


Από το προηγούμενο βήμα της άσκησης θα πάρουμε τις τιμές L1 instruction cache size, L1 instruction cache associativity, L1 data cache size, L1 data cache associativity, L2 cache size , L2 cache associativity, μέγεθος cache line για την τη μέγιστη απόδοση στο σύστημα σας για κάθε benchmark.


Στο bzip (CPI=1. 631585)

-L1 instruction cache size=32kB

- L1 instruction cache associativity=2

- L1 data cache size=64kB

- L1 data cache associativity=8

- L2 cache size=4MB

- L2 cache associativity=8

- Μέγεθος cache line=64

Άρα Ccore=1.383736143722000e+05 μονάδες κόστους


Στο mcf (CPI=1. 139957)


-L1 instruction cache size=32kB

- L1 instruction cache associativity=4

- L1 data cache size=128kB

- L1 data cache associativity=4

- L2 cache size=4MB

- L2 cache associativity=8

- Μέγεθος cache line=64

Άρα Ccore=1.003270683906400e+05 μονάδες κόστους




Στο jeng (CPI=6.795093)

-L1 instruction cache size=32kB

- L1 instruction cache associativity=4

- L1 data cache size=128kB

- L1 data cache associativity=4

- L2 cache size=4MB

- L2 cache associativity=8

- Μέγεθος cache line=128

Άρα Ccore=5.980350477151199e+05 μονάδες κόστους



Στο hmmer (CPI=1.181403)


-L1 instruction cache size=32kB

- L1 instruction cache associativity=4

- L1 data cache size=64kB

- L1 data cache associativity=4

- L2 cache size=4MB

- L2 cache associativity=8

- Μέγεθος cache line=128

Άρα Ccore=1.001945994055200e+05 μονάδες κόστους



Στο lbm (CPI=2.576597)


-L1 instruction cache size=32kB

- L1 instruction cache associativity=4

- L1 data cache size=128kB

- L1 data cache associativity=4

- L2 cache size=4MB

- L2 cache associativity=8

- Μέγεθος cache line=128

Άρα Ccore=2.267658897144800e+05 μονάδες κόστους


Παρατηρούμε ότι το μικρότερο κόστο για κέθε benchmark η αρχιτεκτονική hmmer που βελτιστοποιεί την απόδοση του συστήματος σε σχέση με το κόστος του.

Συμπεράσματα και Συμβιβασμοί
Η αρχιτεκτονική του hmmer με κόστος πυρήνα Ccore=1.001945994055200×105C_{\text{core}} = 1.001945994055200 \times 10^5 προσφέρει καλή σχέση κόστους/απόδοσης με CPI = 1.181403. Οι βασικές επιλογές και οι συμβιβασμοί περιλαμβάνουν:

1.	L1 Instruction Cache (32KB, 4-way)

o	Επιλέχθηκε μέτριο μέγεθος και associativity για καλή απόδοση χωρίς υπερβολικό κόστος.
o	Μικρότερες L1 θα αύξαναν τα misses, ενώ μεγαλύτερες θα αύξαναν το κόστος.

2.	L1 Data Cache (64KB, 4-way)

o	Παρέχει αρκετό χώρο για συχνά χρησιμοποιούμενα δεδομένα, με ισορροπία απόδοσης-κόστους.
o	Εναλλακτικά, μια μικρότερη L1 data cache θα μπορούσε να μειώσει το κόστος με μικρή επίδραση στην απόδοση.

3.	L2 Cache (4MB, 8-way)

o	Μεγάλο μέγεθος για μείωση των misses, αν και αυξάνει το κόστος.
o	Πιθανή μείωση του associativity ή του μεγέθους θα μπορούσε να μειώσει το κόστος χωρίς σημαντική επίπτωση στο CPI.

4.	Cache Line Size (128B)

o	Βελτιώνει τη μεταφορά δεδομένων, αλλά μπορεί να αυξήσει το κόστος σε μικρά workloads.
o	Ένα μικρότερο μέγεθος (64B) μπορεί να προσφέρει καλύτερη ισορροπία.

5.	CPI (1.181403)

o	Δείχνει αποτελεσματική χρήση της cache ιεραρχίας.
o	Μια μικρή αύξηση της L1 μπορεί να μειώσει το CPI, αλλά με αυξημένο κόστος.

Συμπέρασμα:
Η επιλεγμένη αρχιτεκτονική είναι μια καλή ισορροπία μεταξύ κόστους και απόδοσης, με περιθώρια βελτίωσης στη μείωση του L2 μεγέθους ή του cache line size για περαιτέρω εξοικονόμηση κόστους.


ΠΗΓΕΣ:

[https://www.anandtech.com](https://www.anandtech.com/)

https://en.wikipedia.org/wiki/CPU_cache

https://www.intel.com/content/www/us/en/ark.html

Hennessy, J. L., & Patterson, D. A. Computer Architecture: A Quantitative Approach.




