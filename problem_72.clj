(ns clj-test.core) 

(use 'clojure.contrib.math)

(defn gen-primes-map [n]
  (let [reduce-one-prime
        (fn [primes-map p]
          (if (contains? primes-map p)
            primes-map
            (reduce #(assoc %1 %2 false)
                    (assoc primes-map p true)
                    (range (* p 2) (inc n) p))))]
    (reduce reduce-one-prime
            (reduce-one-prime {} 2)
            (range 3 (inc n) 2))))

(def N (expt 10 6))
(def primes-map (gen-primes-map N))

(def mgcd (memoize gcd))

(defn phi
  ([n] 
   (if (primes-map n)
     (dec n)
     (phi n 2)))
  ([n d]
   (if (<= n d)
     (dec d)
     (if (= (mod n d) 0)
       (let [m (/ n d)
             g (mgcd m d)]
         (/ (* (phi m) (phi d) g) (phi g)))
       (recur n (inc d))))))

(defn fractions-count [n]
  (->> (inc n)
       (range 2)
       (map phi)
       (reduce +)))

(println "Answer:" (fractions-count N))

(defn -main []
)
