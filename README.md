# arch_comp_GEM5


ΑΡΧΙΤΕΚΤΟΝΙΚΗ ΥΠΟΛΟΓΙΣΤΩΝ-Εισαγωγή στον Εξομοιωτή gem5



Ονοματεπώνυμο: Στρατάκη Αγγελική
ΑΕΜ: 10523
Email: angeliksi@ece.auth.gr
Ημερομηνία: Ιανουάριος 2025












ΜΕΡΟΣ ΠΡΩΤΟ
Βήμα 1ο
Χρησιμοποιήσαμε το έτοιμο ένα πρόγραμμα virtualization, συγκεκριμένα το VM VMWare Workstation Player 15.

Βήμα 2ο
Ερωτήματα Πρώτου Μέρους 1
	Στο αρχείο starter_se.py εντοπίσαμε τις βασικές παραμέτρους του συστήματος που πρόκειται να εξομοιωθεί από τον gem5.
	Τύπος CPU, Caches:
 
 

	Συχνότητα Λειτουργίας (Clock Frequency):
 ![εικόνα](https://github.com/user-attachments/assets/e1ceb820-c1af-4e40-ae92-03a23e49a564)
 ![εικόνα](https://github.com/user-attachments/assets/8628a6c8-ffc8-47a5-ad7f-2cface063b0f)


 
	Φυσική μνήμη (RAM):
 
	Τύπος μνήμης:
 
	Αριθμός πυρήνων:
 
	Cache Line Size:
 
	Bus (Δίαυλος μνήμης):
 
	Από τη μέθοδο addL1() και addL2() στο αρχείο, αυτές οι caches προστίθενται αν η λειτουργία είναι timing
 
	Τάση:
 



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
	Αυτό δείχνει ότι ο επεξεργαστής που χρησιμοποιείται είναι το μοντέλο MinorCPU.
 
	Αυτό σημαίνει ότι η συχνότητα λειτουργίας του επεξεργαστή έχει οριστεί σε 1GHz.
 
	Αυτές οι γραμμές δείχνουν ότι χρησιμοποιούνται L2 instruction cache (icache) και L2 data cache (dcache). 
 
	Αυτό δείχνει ότι η μνήμη του συστήματος έχει οριστεί στα περίπου 214MB.
 
Στο config.json:
Αντίστοιχα σε αυτό το αρχείο βρήκαμε πάλι τα ίδια.
    
(b) Τι είναι τα sim_seconds, sim_insts, και host_inst_rate:
	sim_seconds:
	Είναι ο συνολικός χρόνος σε δευτερόλεπτα προσομοίωσης που πέρασε μέσα στο σύστημα που εξομοιώνεται.
	Αντιπροσωπεύει το χρόνο που μετράει το εξομοιωμένο σύστημα (όχι ο χρόνος στον πραγματικό υπολογιστή που εκτελεί την προσομοίωση).
 

	sim_insts:
	Είναι ο συνολικός αριθμός των εντολών που εκτελέστηκαν (committed) κατά τη διάρκεια της εξομοίωσης.
	Αντιπροσωπεύει το πλήθος των εντολών που έχουν περάσει τη φάση commit στον pipeline της CPU.
 

	host_inst_rate:
	Είναι ο ρυθμός εκτέλεσης εντολών ανά δευτερόλεπτο στον υπολογιστή που φιλοξενεί τον εξομοιωτή (host machine).
	Δείχνει πόσο αποδοτικά εκτελείται η προσομοίωση στον πραγματικό υπολογιστή.
 

(c) Το συνολικό νούμερο των "committed" εντολών βρίσκεται στα στατιστικά (stats.txt) και είναι 5027.
 
system.cpu_cluster.cpus.committedInsts           5027                       # Number of instructions committed
system.cpu_cluster.cpus.committedOps             5831                       # Number of ops (including micro ops) committed
  Η διαφορά προκύπτει επειδή τα στατιστικά που παράγονται από τον gem5 περιλαμβάνουν μόνο committed εντολές. Κάποιες εντολές μπορεί να έχουν αποτύχει ή να έχουν σταματήσει πριν το στάδιο commit (π.χ., λόγω branch misprediction). Επίσης, ο gem5 μπορεί να εκτελεί εσωτερικές εντολές (π.χ., λειτουργίες boot) που δεν καταγράφονται ως "committed" από τον χρήστη.

(d) Οι προσπελάσεις στην L2 cache βρίσκονται στο αρχείο stats.txt και είναι 474.
 
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
   
 

TimingSimpleCPU:
  
(b)  Διαφορές και Επεξήγηση Αποτελεσμάτων
	MinorCPU: Προσομοιώνει πλήρως όλα τα στάδια του pipeline, επομένως η εκτέλεση είναι πιο αργή. Ο χρόνος εκτέλεσης (sim_seconds) αναμένεται να είναι μεγαλύτερος από το TimingSimpleCPU.
	TimingSimpleCPU: Λόγω της απλοποιημένης προσέγγισης (χωρίς πλήρη προσομοίωση του pipeline), η εκτέλεση είναι πιο γρήγορη.


C) Αλλαγή Παραμέτρων 
1. Αλλαγή Συχνότητας CPU
MinorCPU:
  
TimingSimpleCPU:
  

2) Αλλαγή Τεχνολογίας Μνήμης
DDR4_2400_8X8:
   


DDR3_1600_8x8:
   












ΜΕΡΟΣ ΔΕΥΤΕΡΟ
Βήμα 1ο 
Στο δεύτερο μέρος της εργασίας ασχοληθήκαμε με την εκτέλεση των SPEC CPU2006 benchmarks στον gem5 είναι μια κοινή προσέγγιση για την ανάλυση της απόδοσης των συστημάτων. Τα SPEC benchmarks είναι σύνολα προγραμμάτων που σχεδιάστηκαν για να αξιολογούν την απόδοση των υπολογιστικών συστημάτων, και ειδικότερα των CPUs, μέσω πραγματικών workloads.
 
  
     

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
    

       

 
Από τα γραφήματα που παρουσιάζονται, μπορούμε να παρατηρήσουμε τα εξής:
1. Χρόνος Εκτέλεσης (Execution Time):
	Ο χρόνος εκτέλεσης αυξάνεται σταδιακά ανάλογα με το benchmark.
	Το jeng έχει τον μεγαλύτερο χρόνο εκτέλεσης, ενώ το bzip τον μικρότερο.
	Αυτό υποδεικνύει ότι το jeng απαιτεί σημαντικά περισσότερους πόρους.
2. CPI (Cycles Per Instruction):
	Το CPI είναι πολύ υψηλό για το jeng, κάτι που συνάδει με τον αυξημένο χρόνο εκτέλεσης.
	Τα benchmarks hmmer και bzip έχουν χαμηλό CPI, δείχνοντας καλύτερη απόδοση.
	Η συσχέτιση μεταξύ CPI και χρόνου εκτέλεσης είναι εμφανής.
3. Miss Rates - L1 Instruction Cache:
	Το mcf και το jeng παρουσιάζουν σχετικά υψηλά Miss Rates.
	Τα benchmarks bzip και hmmer έχουν σχεδόν μηδενικά Miss Rates, υποδεικνύοντας ότι η L1 Instruction Cache είναι πολύ αποδοτική σε αυτά.
4. Miss Rates - L1 Data Cache:
	Το libquantum έχει τον υψηλότερο Miss Rate στη L1 Data Cache, γεγονός που υποδηλώνει συχνές αστοχίες.
	Τα υπόλοιπα benchmarks έχουν πολύ χαμηλά Miss Rates, κάτι που δείχνει αποδοτική χρήση της L1 Data Cache.
5. Miss Rates - L2 Cache:
	Το bzip και το libquantum έχουν εξαιρετικά υψηλά Miss Rates στην L2 Cache.
	Το hmmer έχει σχετικά χαμηλά Miss Rates, που ενδέχεται να συμβάλλουν στην καλύτερη απόδοσή του.

Συνολική Παρατήρηση:
	Το jeng είναι το benchmark με τη χαμηλότερη απόδοση λόγω υψηλού CPI και χρόνου εκτέλεσης.
	Τα bzip και hmmer δείχνουν βελτιστοποιημένη χρήση μνήμης με χαμηλά Miss Rates και CPI.
	Το υψηλό Miss Rate στην L2 Cache για το libquantum και το bzip πιθανώς επηρεάζει την απόδοσή τους αρνητικά.



3) Τρέξαμε ξανά τα benchmarks στον gem5 με τον ίδιο τρόπο με προηγουμένως αλλά αυτή τη φορά προσθέστε και την παράμετρο --cpu-clock=1GHz και --cpu-clock=3GHz.
	1GHz	2GHz (default)	3GHz
system.clk_domain.clock	1000	1000	1000
cpu_cluster.clk_domain.clock	1000	500	333

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
  
  





Βήμα 3ο 
Κόστος =[(kmem×Smem)+(kassoc×Aassoc)]*CPI
Όπου:
	kmem είναι ο συντελεστής κόστους ανά μονάδα μνήμης.
	Smem είναι το μέγεθος της μνήμης (π.χ., 32KB για L1, 256KB για L2).
	kassoc είναι ο συντελεστής κόστους ανά μονάδα associativity.
	Aassoc είναι ο βαθμός associativity (π.χ., 2-way, 4-way, 8-way).
Ακριβώς, όταν σχεδιάζουμε την ιεραρχία μνήμης σε έναν επεξεργαστή, πρέπει να εξετάσουμε διάφορους παράγοντες που επηρεάζουν το κόστος και την απόδοση. Η τιμή που πρέπει να πληρώσουμε για κάθε επίπεδο μνήμης (L1, L2, κλπ.) εξαρτάται από το μέγεθος, τη ταχύτητα και την πολυπλοκότητα του συστήματος μνήμης. Ας δούμε αυτά τα σημεία πιο αναλυτικά.
1. Τιμή και Κόστος για τις Caches (L1 vs L2):
Η L1 cache έχει ένα σημαντικά υψηλότερο κόστος σε σχέση με την L2 cache, και αυτό οφείλεται σε διάφορους λόγους:
	Ταχύτητα (Latency):
	Η L1 cache είναι η ταχύτερη μνήμη και είναι σχεδιασμένη για να εξυπηρετεί τις πιο συχνές και ταχείς απαιτήσεις του επεξεργαστή. Γι' αυτό, συνήθως βρίσκεται πολύ κοντά στον επεξεργαστή και είναι πολύ γρήγορη (μικρότερη καθυστέρηση).
	Η L2 cache, αν και επίσης ταχεία, είναι κάπως πιο αργή από την L1, καθώς είναι μεγαλύτερη σε μέγεθος και μπορεί να βρίσκεται πιο μακριά από τον επεξεργαστή, ενσωματώνοντας και περισσότερες δυνατότητες αποθήκευσης.
	Μέγεθος:
	Η L1 cache είναι συνήθως μικρότερη σε μέγεθος (συχνά 32KB ή 64KB ανά επίπεδο — για L1i και L1d). Το μικρό μέγεθος απαιτεί την κατασκευή μικρών, γρήγορων αλλά πολυπλοκότερων κυκλωμάτων.
	Η L2 cache είναι μεγαλύτερη (συνήθως 256KB - 4MB), απαιτώντας περισσότερους πόρους για την υλοποίησή της, αλλά λόγω του μεγαλύτερου μεγέθους είναι λιγότερο ακριβή σε σχέση με την L1.
	Κόστος Υλοποίησης:
	Η L1 cache έχει μεγαλύτερο κόστος υλοποίησης λόγω της ανάγκης για ταχύτητα και χαμηλή καθυστέρηση. Η L1 έχει αυξημένες απαιτήσεις σε ό,τι αφορά την ισχύ και τη σύνθετη λογική που απαιτείται για την ανάγνωση δεδομένων πολύ γρήγορα. Χρειάζεται επίσης πιο σύνθετο υλικό για να περιορίσει την καθυστέρηση της πρόσβασης.
	Η L2 cache, αν και μεγαλύτερη, έχει πιο περιορισμένες απαιτήσεις ταχύτητας σε σχέση με την L1 και, επομένως, το κόστος της είναι χαμηλότερο.

2. Αύξηση Associativity και Πολυπλοκότητα:
Η αύξηση του associativity στην cache (όπως το 4-way associativity ή το 8-way associativity) αυξάνει την πολυπλοκότητα του συστήματος cache και, ως εκ τούτου, το κόστος της υλοποίησης της cache.
	Associativity και Πολυπλοκότητα:
	Όταν αυξάνεται το associativity, αυξάνεται ο αριθμός των συγκρούσεων (conflicts) που μπορούν να αποτραπούν και συνεπώς, η cache γίνεται πιο ευέλικτη στην αποθήκευση δεδομένων. Αυτό μειώνει την πιθανότητα cache misses και αυξάνει την αποδοτικότητα της μνήμης, γιατί μπορούν να αποθηκευτούν περισσότερα δεδομένα ανά "σετ".
	Ωστόσο, η αύξηση του associativity απαιτεί περισσότερο λογικό κύκλωμα για να διαχειριστεί την αντιστοίχιση των δεδομένων και να διατηρήσει τη λειτουργία της cache, κάτι που αυξάνει την πολυπλοκότητα και το κόστος. Η ανάγκη για περισσότερους συγκριτές (comparators) και πιο περίπλοκες δομές δεδομένων (όπως πίνακες κατανομής δεδομένων) καθιστούν το σύστημα πιο περίπλοκο και ακριβό στην υλοποίηση.
	Πλεονεκτήματα της Αύξησης Associativity:
	Ενισχύει την hit rate (ποσοστό επιτυχημένων προσβάσεων στη cache).
	Μειώνει τις συγκρούσεις, καθώς είναι λιγότερο πιθανό να αντικατασταθούν δεδομένα που χρησιμοποιούνται συχνά.
	Μειονεκτήματα:
	Αυξάνει την πολυπλοκότητα του κυκλώματος και το κόστος.
	Χρειάζεται περισσότερος χρόνος για την αναζήτηση και αντιστοίχιση των δεδομένων (δηλαδή αυξάνει την καθυστέρηση).
	Χρειάζεται περισσότερο χώρο για αποθήκευση του επιπλέον λογισμικού που απαιτείται για την αποτελεσματική λειτουργία.
3. Αντίκτυπος Στη Συνολική Απόδοση:
Η βελτίωση της απόδοσης του συστήματος μέσω της αύξησης του associativity ή του μεγέθους της cache έχει άμεσο αντίκτυπο στο CPI και την καθυστέρηση:
	Η αύξηση της L1 cache ή του associativity βοηθά στη μείωση του αριθμού των cache misses και την καλύτερη εκμετάλλευση της μνήμης, κάτι που μειώνει το CPI και αυξάνει την απόδοση του επεξεργαστή.
	Αντίστοιχα, η αύξηση του μεγέθους της L2 cache (ή η βελτίωση του associativity της) μπορεί να μειώσει το CPI, αλλά το κόστος υλοποίησης αυξάνεται, και μερικές φορές η καθυστέρηση της L2 μπορεί να προκαλέσει και πάλι σημαντικές καθυστερήσεις.
Συμπεράσματα:
	L1 Cache (Μεγαλύτερη Τιμή) και L2 Cache (Λιγότερη Τιμή): Η L1 cache έχει μεγαλύτερη τιμή υλοποίησης λόγω του μικρού μεγέθους της, της υψηλής ταχύτητας και των αυξημένων απαιτήσεων για γρήγορη πρόσβαση στα δεδομένα. Η L2 cache, αν και μεγαλύτερη, έχει χαμηλότερο κόστος λόγω του ότι είναι πιο αργή και λιγότερο απαιτητική σε σχέση με την L1.
	Αύξηση Associativity: Αυξάνοντας το associativity, μειώνεται η πιθανότητα συγκρούσεων και βελτιώνεται η απόδοση της cache, αλλά η πολυπλοκότητα του συστήματος αυξάνεται και το κόστος για την υλοποίηση ανεβαίνει. Ως αποτέλεσμα, η αύξηση του associativity απαιτεί να ζυγίσεις το κόστος και την απόδοση για να διασφαλίσεις τη βέλτιστη ισορροπία.
	Στρατηγικές για Μείωση του Κόστους και Βελτίωση Απόδοσης: Κάθε αρχιτεκτονική θα πρέπει να διασφαλίσει μια ισχυρή ισορροπία μεταξύ ταχύτητας, μεγέθους και πολυπλοκότητας για να επιτύχει τη βέλτιστη απόδοση, ελαχιστοποιώντας ταυτόχρονα το κόστος και τις καθυστερήσεις.

